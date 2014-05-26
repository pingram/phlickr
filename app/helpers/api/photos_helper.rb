module Api::PhotosHelper
  def get_explore_photos(page_num)
    json_photos = get_json_photos(page_num)

    hashed_photos = JSON.parse(json_photos)["photos"]["photo"]
    photos = []

    hashed_photos.each do |photo_hash|
      photos << get_photo_to_add(photo_hash)
    end
    photos
  end

  def get_photo_to_add(photo_hash)
    id = photo_hash['id']
    secret = photo_hash['secret']
    server_id = photo_hash['server']
    size = 'm'

    newPhotoUrl = Addressable::URI.new(
      :scheme => "http",
      :host => "farm#{photo_hash['farm']}.staticflickr.com",
      :path => "#{server_id}/#{id}_#{secret}_#{size}.jpg"
    ).to_s

    Photo.new(url: newPhotoUrl)
  end

  def get_json_photos(page_num)
    photoExploreUrl = Addressable::URI.new(
      :scheme => "https",
      :host => "api.flickr.com",
      :path => "services/rest/",
      :query_values => {:method => "flickr.interestingness.getList",
        :api_key => ENV["FLICKR_API_KEY"],
        :format => "json",
        :nojsoncallback => "1",
        :per_page => "10",
        :page => "#{page_num}"
      }
    ).to_s

    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret=ENV["FLICKR_SECRET"]

    json_photos = RestClient.get(photoExploreUrl)
  end
end
