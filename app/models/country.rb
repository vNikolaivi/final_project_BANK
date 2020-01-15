class Country < ApplicationRecord
  has_many :cities
  has_many :users, through: :cities
end
