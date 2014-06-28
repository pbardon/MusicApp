# == Schema Information
#
# Table name: bands
#
#  id             :integer          not null, primary key
#  band_name      :string(255)      not null
#  band_photo_url :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Band < ActiveRecord::Base

  validates :band_name, presence: true
  validates :band_name, uniqueness: true

  has_many :albums, dependent: :destroy
end
