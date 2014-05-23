Phlickr.Views.PhotoUpload = Backbone.View.extend({
  className: 'body-padded',
  template: JST['photos/upload'],

  initialize: function () {
    this.model = new Phlickr.Models.Photo();
  },

  events: {
    'submit form' : 'submit',
    'change input[type=file]' : 'encodeFile'
  },

  render: function () {
    console.log('render photo upload');
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  encodeFile: function (event) {
    var photo = this.model;
    var file = event.currentTarget.files[0];
    
    console.log(file);
    
    var reader = new FileReader();
    reader.onload = function(e) {
      console.log(e.target.result);
      photo.set({ photo: e.target.result });
    }
    reader.onerror = function(stuff) {
      console.log("error", stuff)
      console.log (stuff.getMessage())
    }
    reader.readAsDataURL(file);
  },

  submit: function (event) {
    event.preventDefault();
    
    var attrs = $(event.currentTarget).serializeJSON();
    this.model.set(attrs);

    this.model.save(null, {
      success: function (attribute) {
        console.log("file uploaded successfully!");
        Backbone.history.navigate('profile', { trigger: true });
      },
    });
  },
});