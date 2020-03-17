class Bill < ApplicationRecord
  attr_accessor :user, :user_id, :sender_id, :recipient_id
  #belongs_to :user
  has_one :bill_request
  has_one :manager_notification
  has_many :transactions
  def to_s_select
    to_s(:select)
  end
end