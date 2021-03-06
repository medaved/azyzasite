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

class Image < ActiveRecord::Base
  acts_as_list scope: :gallery_id
  mount_uploader :fileimage, ImageUploader#, :mount_on => :
  belongs_to :gallery
  #validates :name, presence: true
end
