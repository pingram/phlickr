Phlickr.Views.AlbumIndex = Backbone.CompositeView.extend({
  template: JST['albums/index'],

  initialize: function (options) {
    this.collection = options.collection;
    this.user = options.user;
    this.listenTo(this.collection, 'sync remove', this.render);

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
    this.$el.find('#confirm-delete').on('show.bs.modal', function(e) {
      var albumId = $(e.relatedTarget).attr('data-album-id');
      $(this).find('.delete-album-confirm').attr('data-album-id', albumId);
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
    event.preventDefault();
    var albums = this.collection;
    
    // needed to force modal removal from backbone
    $('#confirm-delete').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();

    var albumId = $(event.target).data('album-id')
    var album = new Phlickr.Models.Album({ id: albumId });

    album.destroy({
      success: function () {
        console.log("album " + album.id + " deleted");
        debugger
        albums.remove(album);
      }
    });
  }
})