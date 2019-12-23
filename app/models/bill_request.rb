class BillRequest < ApplicationRecord
  attr_accessor :manager_id, :manager, :bill_id, :bill
  belongs_to :bill
  belongs_to :manager
end
