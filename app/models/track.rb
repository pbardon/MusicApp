# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  track_name :string(255)      not null
#  lyrics     :text
#  album_id   :integer          not null
#  bonus?     :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  validates :track_name, :album_id, presence: true

  validates :bonus, inclusion: {in: [true, false]}

  belongs_to(:album)
end
