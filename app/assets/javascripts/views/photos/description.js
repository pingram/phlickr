Phlickr.Views.Description = Backbone.View.extend({
  template: function() {
    return this.open ? JST["photos/description-edit"] : JST["photos/description"];
  },

  initialize: function (options) {
    this.model = options.model; // model is the whole photo
    this.open = options.open || false;
  },

  render: function () {
    var renderedContent = this.template()({
      photo: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }  
});