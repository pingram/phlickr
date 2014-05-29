Phlickr.Views.PhotoUpload = Backbone.View.extend({
  className: 'body-padded upload-view-container',
  template: JST['photos/upload'],

  initialize: function () {
    this.model = new Phlickr.Models.Photo();
  },

  events: {
    'click button.submit-dropzone': 'submitDropzone'
    // 'submit form' : 'submit',
    // 'change input[type=file]' : 'encodeFile'
  },

  submitDropzone: function (event) {
    Backbone.history.navigate('profile', { trigger: true });
  },

  render: function () {
    var view = this;
    var renderedContent = this.template({
      photo: this.model
    });
    this.$el.html(renderedContent);
    var dropzoneEl = this.$el.find('#my-awesome-dropzone')[0];

    this.myDropzone = new Dropzone(dropzoneEl, {
      autoProcessQueue: false,
      url: "#",
      init: function(file) {
        this.on("addedfile", function(file) {
          view.encodeAndUpload(file);
        });
      }
    });

    Dropzone.autoDiscover = false;
    $(dropzoneEl).addClass('dropzone');

    return this;
  },

  encodeAndUpload: function (file) {
    var photo = this.model;
    var view = this;

    this.$el.find('#dropbox-text').fadeOut(1500);
    this.$el.find('#dropbox-text2').fadeOut(1500);
    
    // console.log(file);
    
    var reader = new FileReader();
    reader.onload = function(e) {
      // console.log(e.target.result);
      photo.set({ photo: e.target.result });
      view.savePhoto();
    }
    reader.onerror = function(stuff) {
      // console.log("error", stuff)
      // console.log (stuff.getMessage())
    }
    reader.readAsDataURL(file);
  },

  savePhoto: function (event) {
    this.model.save();
  },
});