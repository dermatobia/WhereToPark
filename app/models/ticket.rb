class Ticket < ActiveRecord::Base
	belongs_to :user
	belongs_to :location
	belongs_to :violation

  validates :user_id, presence: true
  validates :location_id, presence: true
  validates :incident_time, presence: true
end 