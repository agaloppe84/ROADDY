class Timeline < ActiveRecord::Base
  belongs_to :user
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy

  geocoded_by :destination
  after_validation :geocode, if: :destination_changed?
end
