Phlickr.Views.PhotoShow = Backbone.CompositeView.extend({
  className: 'photo-show-view',
  
  initialize: function (options) {
    this.model = options.model;
    this.user = new Phlickr.Models.User();

    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.user, 'sync', this.render);

    var descriptionView = new Phlickr.Views.Description({
      model: this.model
    });
    this.addSubview('.photo-description', descriptionView);
  },

  template: JST['photos/show'],

  events: {
    'click div.glyphicon-remove': 'closeView',
    'click button.delete-photo': 'deletePhoto',
    'click p.open-form': 'openForm',
    'click #photo-show-holder': 'closeForm',
    'keypress': 'keypressFn',
    'keyup': 'keypressFn',
    'click .photo-favorite-icon': 'changeFavoriteState'
  },

  keypressFn: function (event) {
    if ((event.keyCode === 13 || event.keyCode === 27)
        && this.subviews()['.photo-description'][0].open) {
      this.closeForm(event);
    }
  },

  render: function() {
    if (this.model.get('url') !== undefined && this.user.id === undefined) {
      this.user.set('id', this.model.get('user_id'));
      this.user.fetch();
    }

    // TODO: render spinner here if no photo
    var renderedContent = this.template({
      photo: this.model,
      user: this.user
    });

    this.$el.html(renderedContent);
    var that = this;

    var spinner = new Spinner().spin();
    // debugger
    this.$el.append(spinner.el);
    this.$el.find('img.main-show-img').hide();
    this.renderSubviews();
    this.updateFavoriteIcon();
    this.$('img.main-show-img').load(function () {
      that.mainImageLoad(spinner);
    });
    return this;
  },

  updateFavoriteIcon: function () {
    if (this.model.get('is_favorite')) {
      this.$el.find('.photo-favorite-icon').removeClass('glyphicon-star-empty')
        .addClass('glyphicon-star')
    }
  },

  mainImageLoad: function (spinner) {
    var photo = $('.main-show-img')
    photo.css('margin-top', -photo.height() / 2);
    photo.css('margin-left', -photo.width() / 2);
    spinner.stop();
    photo.show();
  },

  closeView: function () {
    Backbone.history.history.back({
      trigger: true
    })
  },

  deletePhoto: function(event) {
    event.preventDefault();
    var photo = this.model;
    
    // needed to force modal removal from backboneXXX
    $('#confirm-delete').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();

    photo.destroy();
    Backbone.history.history.back({
      trigger: true
    })
  },

  openForm: function (event) {
    event.preventDefault();
    if (this.model.get('user_id') === this.model.get('current_user_id')) {
      this.subviews()['.photo-description'][0].open = true;
      this.renderSubviews();
      this.$el.find('input.edit-description').focus();
    }
  },

  closeForm: function (event) {
    event.preventDefault();    
    this.submit();
    this.subviews()['.photo-description'][0].open = false;
    this.renderSubviews();
  },

  changeFavoriteState: function (event) {
    var view = this;
    event.preventDefault();
    var $star = this.$el.find('.photo-favorite-icon');
    var photo = this.model;
    var data = { 'id': photo.id };

    $.ajax({
      url: 'api/photos/change_favorite.json',
      data: data,
      success: function(resp) {
        if ($star.hasClass('glyphicon-star-empty')) {
          $star.removeClass('glyphicon-star-empty').addClass('glyphicon-star')
          $.notify('Added to favorites', { className: 'success', position: 'bottom right' });
        } else {
          $star.removeClass('glyphicon-star').addClass('glyphicon-star-empty')
          $.notify('Removed from favorites', { position: 'bottom right' });
        }
      }
    });

  },

  // TODO: add ability to press enter to have it update
  submit: function () {
    var newDescription = $('.photo-description').find('input').val();
    
    if (newDescription !== this.model.get('description')) {
      this.model.set('description', newDescription);

      this.model.save();
    }
  }
});