Phlickr.Views.AlbumIndex = Backbone.CompositeView.extend({
  template: JST['albums/index'],

  initialize: function (options) {
    this.collection = options.collection;
    this.user = options.user;
    this.listenTo(this.collection, 'sync', this.render);

    var userProfileView = new Phlickr.Views.UserProfile({
      model: this.user
    })
    this.addSubview('.user-profile', userProfileView);
  },

  events: {
    'click .albums-new-album': 'newAlbum',
    'click .album-delete-icon': 'deleteAlbum',
    'click button.delete-album-confirm': 'deleteAlbumConfirm'
  },

  render: function () {
    // TODO: break out cover_photo url from album to avoid security risk
    var renderedContent = this.template({
      albums: this.collection
    });
    this.$el.html(renderedContent);
    this.renderSubviews();

    // add album id to modal delete button
    $('#confirm-delete').on('show.bs.modal', function(e) {
      var albumId = $(e.relatedTarget).attr('data-album-id');
      $(this).find('.delete-album').attr('data-album-id', albumId);
    });

    return this;
  },

  newAlbum: function () {
    Backbone.history.navigate('albums/new', { trigger: true });
  },

  deleteAlbum: function (event) {
    event.preventDefault();
  },

  deleteAlbumConfirm: function (event) {
    // debugger
    event.preventDefault();
    // var album = this.model;
    
    // needed to force modal removal from backboneXXX
    $('#confirm-delete').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();

    // photo.destroy({
    //   success: function () {
    //     console.log("photo " + photo.id + " deleted");
    //   }
    // });
    // Backbone.history.history.back({
    //   trigger: true
    // })
  }
})