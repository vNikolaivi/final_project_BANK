class Transaction < ApplicationRecord
  #attr_accessor :bill_id, :bill
  belongs_to :bill
end
