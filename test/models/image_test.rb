# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string
#  caption    :string
#  fileimage  :string
#  gallery_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
