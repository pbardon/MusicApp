# == Schema Information
#
# Table name: albums
#
#  id              :integer          not null, primary key
#  album_name      :string(255)      not null
#  band_id         :integer          not null
#  album_cover_url :string(255)
#  live            :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class Album < ActiveRecord::Base

  validates :album_name, :band_id, presence: true
  validates :live, inclusion: { in: [true, false] }

  has_many :tracks, dependent: :destroy
end
