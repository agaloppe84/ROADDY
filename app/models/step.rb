class Step < ActiveRecord::Base
  belongs_to :timeline

  geocoded_by :adress
  after_validation :geocode, if: :adress_changed?
  acts_as_list scope: :timeline
end
