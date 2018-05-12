# == Schema Information
#
# Table name: albums
#
#  id             :bigint(8)        not null, primary key
#  band_id        :integer          not null
#  title          :string           not null
#  year           :integer          not null
#  recording_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validates :recording_type, inclusion: {in: %w(live studio)}
  validates :year, length: {minimum: 4}
  belongs_to :band
end
