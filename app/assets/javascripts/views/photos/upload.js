Phlickr.Views.PhotoUpload = Backbone.View.extend({
  className: 'body-padded upload-view-container',
  template: JST['photos/upload'],

  initialize: function () {
    this.model = new Phlickr.Models.Photo();
  },

  events: {
    // 'submit form' : 'submit',
    // 'change input[type=file]' : 'encodeFile'
  },

  render: function () {
    console.log('render photo upload');
    var renderedContent = this.template({
      photo: this.model
    });
    this.$el.html(renderedContent);
    this.renderFileUploader();
    return this;
  },

  renderFileUploader: function() {
    var photo = this.model;
    var view = this;

    this.$el.find('#fileupload').fileupload({
      dataType: 'json',
      url: 'api/photos',
      add: function (e, data) {
        view.encodeFile(e);
        $("#up_btn").on('click', function () {
            data.submit();
        });

        data.context = $(tmpl("template-upload", file))
        view.$el.append(data.context)
      },

      // progressall: function (e, data) {
      //   var progress = parseInt(data.loaded / data.total * 100, 10);
      //   $('#progress .bar').css(
      //       'width',
      //       progress + '%'
      //   );
      // },

      // progress: function (e, data) {
      //   if (data.context) {
      //     progress = parseInt(data.loaded / data.total * 100, 10)
      //     data.context.find('.bar').css('width', progress + '%')
      //   }
      // },

      // done: function () {debugger},
      // send: function () {debugger},
      // start: function (e, data) {
        // debugger
        
      // },
      submit: function (e, data) {
        $submitBtn = view.$el.find('#up_btn');
        $submitBtn.attr("disabled", "disabled").text('Uploading..');
        // $submitBtn.removeClass('btn-primary').addClass('btn-defaut');

        var attrs = $('form').serializeJSON();
        photo.set(attrs);

        photo.save(null, {
          success: function (attribute) {
            console.log("file uploaded successfully!");
            Backbone.history.navigate('profile', { trigger: true });
          },
        });
      }
    });
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
    // $submitBtn = this.$el.find('input.btn');
    // $submitBtn.attr("disabled", "disabled").val('Uploading..');
    // $submitBtn.removeClass('btn-primary').addClass('btn-success');
    
    var attrs = $('form').serializeJSON();
    this.model.set(attrs);

    this.model.save(null, {
      success: function (attribute) {
        console.log("file uploaded successfully!");
        Backbone.history.navigate('profile', { trigger: true });
      },
    });
  },
});