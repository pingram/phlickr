module Api::PhotosHelper
  def get_explore_photos(page_num, page_width)
    page_width = Integer(page_width)
    # page_width = 1350         #TODO: return and update this XXX

    page_num = Integer(page_num)
    if page_num == 1
      page_size = 10      #originally 50
    else
      page_size = 10
      # page_num += 4       #originally 4
    end

    json_photos = get_json_photos(page_num, page_size, page_width)

    hashed_photos = JSON.parse(json_photos)["photos"]["photo"]
    photos = []

    hashed_photos.reverse.each do |photo_hash|
      photos << get_photo_to_add(photo_hash, page_width)
    end

    sized_photos = size_photos_for_rows(photos, page_width)

    sized_photos
  end

  def size_photos_for_rows(photos, page_width)
    photos_to_resize = photos
    resized_photos = []

    until photos_to_resize.empty?
      i = 0
      working_set = []
      max_r_height = page_width / 3.4
      total_width = 0
      loop do
        break if photos_to_resize.empty?
        working_set << photos_to_resize.pop

        # if !working_set.empty?
          # needResizing = working_set.any? do |photo|
            if working_set[-1].display_height != max_r_height
              # max_r_height = 400
              needResizing = true
            end
          # end
        # end

        resize_photos(working_set, max_r_height) if needResizing
        needResizing = false

        total_width = 0
        working_set.each do |photo|
          total_width += photo.display_width
        end

        # go to resize row if outside width and there is more than 1 photo
        break if (total_width > page_width && i > 0)
        i += 1
      end

      resized_row_photos = resize_row_photos(working_set, total_width, page_width)

      resized_photos << resized_row_photos
    end

    resized_photos
  end

  def resize_row_photos(working_set, total_width, page_width)
    if total_width > page_width   # check to make sure it's not last row
      scaler = total_width / page_width.to_f
      working_set.each do |photo|
        photo.display_height = photo.display_height / scaler
        photo.display_width = photo.display_width / scaler
      end
    end
    working_set
  end

  def resize_photos(working_set, new_height)
    working_set.each do |photo|
      scaler = photo.display_height / new_height.to_f
      photo.display_height = photo.display_height / scaler
      photo.display_width = photo.display_width / scaler
    end

    # if working_set.length > 2
    #   fail
    # end
  end

  def get_photo_to_add(photo_hash, page_width)
    id = photo_hash['id']
    url = page_width > 1400 ? photo_hash['url_l'] : photo_hash['url_m']
    width = page_width > 1400 ? photo_hash['width_l'] : photo_hash['width_m']
    height = page_width > 1400 ? photo_hash['height_l'] : photo_hash['height_m']
    
    # secret = photo_hash['secret']
    # server_id = photo_hash['server']
    # size = 'm'

    # newPhotoUrl = Addressable::URI.new(
    #   :scheme => "http",
    #   :host => "farm#{photo_hash['farm']}.staticflickr.com",
    #   :path => "#{server_id}/#{id}_#{secret}_#{size}.jpg"
    # ).to_s
    # fail

    Photo.new(id: id, url: url, o_width: width, o_height: height,
      display_width: width, display_height: height)
  end

  def get_json_photos(page_num, page_size, page_width)
    url = page_width > 1400 ? "url_l" : "url_m"

    photoExploreUrl = Addressable::URI.new(
      :scheme => "https",
      :host => "api.flickr.com",
      :path => "services/rest/",
      :query_values => {:method => "flickr.interestingness.getList",
        :api_key => ENV["FLICKR_API_KEY"],
        :format => "json",
        :nojsoncallback => "1",
        :per_page => "#{page_size}",
        :page => "#{page_num}",
        :extras => url
      }
    ).to_s

    json_photos = RestClient.get(photoExploreUrl)
  end
end
