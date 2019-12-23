class ManagerNotification < ApplicationRecord
  attr_accessor :manager_id, :manager, :bill_id, :bill
  belongs_to :manager
  belongs_to :bill
end
