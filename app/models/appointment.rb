class Appointment < ActiveRecord::Base
  belongs_to :listing # the listing for this appointment
  belongs_to :user # the buyer for this appointment
end
