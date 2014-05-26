module Api::PhotosHelper
  def get_explore_photos(page_num, page_width)
    page_num = Integer(page_num)
    if page_num == 1
      page_size = 50
    else
      page_size = 10
      page_num += 4
    end

    json_photos = get_json_photos(page_num, page_size)

    hashed_photos = JSON.parse(json_photos)["photos"]["photo"]
    photos = []

    hashed_photos.each do |photo_hash|
      photos << get_photo_to_add(photo_hash)
    end

    sized_photos = size_photos_for_rows(photos)

    sized_photos
  end

  def size_photos_for_rows(photos)
    photos_to_resize = photos

    # until photos_to_resize.empty?
    #   working_set ||= []
    #   working_set << photos_to_resize.pop
    #   fail
    # end
    # resized_photos = working_set
    # resized_photos
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

  def get_json_photos(page_num, page_size)
    photoExploreUrl = Addressable::URI.new(
      :scheme => "https",
      :host => "api.flickr.com",
      :path => "services/rest/",
      :query_values => {:method => "flickr.interestingness.getList",
        :api_key => ENV["FLICKR_API_KEY"],
        :format => "json",
        :nojsoncallback => "1",
        :per_page => "#{page_size}",
        :page => "#{page_num}"
      }
    ).to_s

    json_photos = RestClient.get(photoExploreUrl)
  end
end
