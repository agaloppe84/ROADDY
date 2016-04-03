class Category < ActiveRecord::Base
  has_many :steps
end
