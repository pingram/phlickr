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
    console.log('render photo upload');
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

    $(dropzoneEl).addClass('dropzone');

    return this;
  },

  encodeAndUpload: function (file) {
    var photo = this.model;
    var view = this;
    // var file = event.currentTarget.files[0];
    // var file = this.myDropzone.files[0];
    
    console.log(file);
    // alert('encoded file');
    
    var reader = new FileReader();
    reader.onload = function(e) {
      console.log(e.target.result);
      photo.set({ photo: e.target.result });
      view.savePhoto();
    }
    reader.onerror = function(stuff) {
      console.log("error", stuff)
      console.log (stuff.getMessage())
    }
    reader.readAsDataURL(file);
  },

  savePhoto: function (event) {
    // event.preventDefault();
    // $submitBtn = this.$el.find('input.btn');
    // $submitBtn.attr("disabled", "disabled").val('Uploading..');
    // $submitBtn.removeClass('btn-primary').addClass('btn-success');
    
    // var attrs = $('form').serializeJSON();
    // this.model.set(attrs);

    this.model.save(null, {
      success: function (attribute) {
        console.log("file uploaded successfully!");
      },
    });
  },
});