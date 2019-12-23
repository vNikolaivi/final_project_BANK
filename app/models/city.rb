class City < ApplicationRecord
  attr_accessor :country_id, :country
  belongs_to :country
  has_many :users
end
