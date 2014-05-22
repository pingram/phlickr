Phlickr.Views.PhotoShow = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model;
    this.user = new Phlickr.Models.User();

    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.user, 'sync', this.render);
  },

  template: JST['photos/show'],

  events: {
    'click div.glyphicon-remove': 'closeView'
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

    return this;
  },

  closeView: function () {
    window.history.back();
  }
});