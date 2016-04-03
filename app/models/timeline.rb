class Timeline < ActiveRecord::Base
  belongs_to :user
  has_many :steps , -> { order(position: :asc) }

  geocoded_by :destination
  after_validation :geocode, if: :destination_changed?
end
