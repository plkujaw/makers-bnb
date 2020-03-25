class Booking < ActiveRecord::Base
  has_many :spaces
  belongs_to :user
end
