class Manager < ApplicationRecord
  has_many :bill_requests
  has_many :manager_notifications
end
