Phlickr.Views.PhotoShow = Backbone.CompositeView.extend({
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
    'click #photo-show-holder': 'closeForm'
  },

  render: function() {
    console.log('render photos/show')

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
    this.renderSubviews();

    return this;
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

    photo.destroy({
      success: function () {
        console.log("photo " + photo.id + " deleted");
      }
    });
    Backbone.history.history.back({
      trigger: true
    })
  },

  openForm: function (event) {
    event.preventDefault();
    this.subviews()['.photo-description'][0].open = true;
    this.renderSubviews();
  },

  closeForm: function (event) {
    event.preventDefault();
    this.subviews()['.photo-description'][0].open = false;
    this.renderSubviews();
  },
});