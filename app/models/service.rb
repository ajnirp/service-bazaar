class Service < ActiveRecord::Base
  belongs_to :user

  has_many :listings, dependent: :destroy
end
