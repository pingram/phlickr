Phlickr.Views.UserProfile = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model
    this.collection = new Phlickr.Collections.UserPhotos([], {
      user_id: options.model.id
    })

    this.collection.fetch();
    this.listenTo(this.collection, 'sync', this.render);
  },

  template: JST['users/profile'],

  render: function() {
    console.log('render users/profile')
    var renderedContent = this.template({
      user: this.model,
      photos: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});