Phlickr.Views.PhotoShow = Backbone.View.extend({
  initialize: function (options) {
    this.model = options.model
    this.listenTo(this.model, 'sync', this.render);
  },

  template: JST['photos/show'],

  render: function() {
    console.log('render photos/show')
    
    // TODO: render spinner here if no photo
    var renderedContent = this.template({
      photo: this.model
    });
    this.$el.html(renderedContent);

    return this;
  }
});