class Category < ActiveRecord::Base
  has_many :liesins
  has_many :services, through: :liesins
end
