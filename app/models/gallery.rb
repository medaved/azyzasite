# == Schema Information
#
# Table name: galleries
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#  position   :integer
#

class Gallery < ApplicationRecord
  validates :name, presence: true
  acts_as_list

  mount_uploader :image, ImageUploader

  has_many :images

  # rails_admin do
  #   sort_by :position           # Add Default sorting
  #   sort_reverse false          # sort position increasing ('asc')
  # end

  def create_associated_image(image)
    images.create(fileimage: image)
  end
end
