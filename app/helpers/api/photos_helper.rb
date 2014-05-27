module Api::PhotosHelper
  def get_explore_photos(page_num, page_width)
    page_width, page_num, page_size = get_page_variables(page_num, page_width)

    json_photos = get_json_photos(page_num, page_size, page_width)

    hashed_photos = JSON.parse(json_photos)["photos"]["photo"]
    photos = []

    hashed_photos.reverse.each do |photo_hash|
      photos << get_photo_to_add(photo_hash, page_width)
    end

    sized_photos = size_photos_for_rows(photos, page_width, page_num)

    sized_photos
  end

  def get_page_variables(page_num, page_width)
    page_width = Integer(page_width) - 40
    # page_width = 1350

    page_num = Integer(page_num)
    if page_num == 1
      page_size = 20      #originally 50
    else
      page_size = 10
      page_num += 1       #originally 4
    end

    [page_width, page_num, page_size]
  end

  def size_photos_for_rows(photos, page_width, page_num)
    filename = Rails.root.join('lib/trailing_photos/tp_user_' +
      current_user.id.to_s + '.yaml')
    if page_num == 1 && File.exist?(filename)
      File.delete(filename)
    end

    prev_photos = []

    # TODO: figure out why there are duplicates showing up with the saved file
    if File.exist?(filename)
      prev_photos = YAML.load_file(filename)
    end

    photos_to_resize = prev_photos + photos
    resized_photos = []

    until photos_to_resize.empty?
      i = 0
      working_set = []
      max_r_height = page_width / 3.4
      total_width = 0
      loop do
        if photos_to_resize.empty?
          if File.exist?(filename)
            File.delete(filename)
          end
          File.write(filename, YAML.dump(working_set))
          working_set = []
          break
        end
        working_set << photos_to_resize.pop

        if working_set[-1].display_height != max_r_height
          needResizing = true
        end

        resize_photos(working_set, max_r_height) if needResizing
        needResizing = false

        total_width = 10 * (working_set.length - 1)  # 10 is for the margin
        working_set.each do |photo|
          total_width += photo.display_width
        end

        # go to resize row if outside width and there is more than 1 photo
        break if (total_width > page_width && i > 0)
        i += 1
      end

      if !working_set.empty?
        resized_row_photos =
          resize_row_photos(working_set, total_width, page_width)
        resized_photos << resized_row_photos
      end
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
    working_set
  end

  def get_photo_to_add(photo_hash, page_width)
    id = photo_hash['id']

    if page_width < 1400 && (Integer(photo_hash['width_m']) > 300 &&
                             Integer(photo_hash['height_m']) > 300)
      url = photo_hash['url_m']
      width = photo_hash['width_m']
      height = photo_hash['height_m']
    else
      url = photo_hash['url_l']
      width = photo_hash['width_l']
      height = photo_hash['height_l']
    end

    # if id == '14250335136'
    #   fail
    # end

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
        :extras => "url_l, url_m"
      }
    ).to_s

    json_photos = RestClient.get(photoExploreUrl)
  end
end
