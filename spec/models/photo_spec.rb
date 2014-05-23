# == Schema Information
#
# Table name: photos
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  description       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  url               :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'spec_helper'

describe Photo do
  pending "add some examples to (or delete) #{__FILE__}"
end
