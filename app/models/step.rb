class Step < ActiveRecord::Base
  belongs_to :timeline
  belongs_to :category

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  acts_as_list scope: :timeline

  attr_accessor :distance_with_next_step


  def lat_lng
    "#{latitude}, #{longitude}"
  end

  def to_lat_lng
    [latitude, longitude]
  end
end
