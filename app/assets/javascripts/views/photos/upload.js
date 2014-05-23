Phlickr.Views.PhotoUpload = Backbone.View.extend({
  template: JST['photos/upload'],

  render: function () {
    console.log('render photo upload');
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }  
});