Phlickr.Collections.Photos = Backbone.Collection.extend({
  model: Phlickr.Models.Photo,
  url: 'api/photos',
})