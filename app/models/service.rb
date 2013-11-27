class Service < ActiveRecord::Base
  belongs_to :user

  has_many :listings, dependent: :destroy

  has_one :liesin
  has_one :category, through: :liesin


  has_many :feedbacks
end
