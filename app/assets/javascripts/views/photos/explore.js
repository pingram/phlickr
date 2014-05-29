Phlickr.Views.PhotoExplore = Backbone.CompositeView.extend({
  className: "body-padded photo-explore-container",
  template: JST['photos/explore'],

  initialize: function (options) {
    this.collection = options.collection;
    this.listenTo(this.collection, 'add', this.render);

    _.bindAll(this, 'checkScroll');
    $(window).scroll(this.checkScroll);
  },

  events: {
    'click .more': 'more'
  },

  render: function () {
    var renderedContent = this.template({
      photo_rows: this.collection
    });

    this.$el.html(renderedContent); 
    installHandlers();
    return this;
  },

  more: function () {
    this.$('.more').html('loading...').attr('disabled', 'disabled');
    Phlickr.Routers.app_router.photoExplore();
  },

  checkScroll: function (event) {
    if(($(window).scrollTop() + $(window).height() > $(document).height() - 800)
      && (Phlickr.Collections.explorePhotos &&
        !Phlickr.Collections.explorePhotos.isLoading)) {
      Phlickr.Collections.explorePhotos.isLoading = true;
      this.more();
    }
  }
})