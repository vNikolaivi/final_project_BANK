class BillBuilder
  def self.build
    builder = new
    yield(builder)
    builder.bill
  end

  def initialize
    @bill = Bill.new
  end

  def set_name(first_name, last_name)
    @user.first_name = first_name
    @user.last_name = last_name
  end

  def set_as_personal
    @bill.type = ['personal']
  end

  def set_as_credit
    @bill.type = ['credit']
  end

  def set_as_deposit
    @bill.type = ['deposit']
  end

  def set_amount
    @bill.amount = amount
  end

  def set_percent
    @bill.persent = percent
  end

  def set_created_at
    @bill.created_at = created_at
  end

  def set_updated_at
    @bill.updated_at = updated_at
  end

  def set_closed_at
    @bill.closed_at = closed_at
  end

  def set_replenishment_at
    @bill.replenishment_at = replenishment_at
  end

  def set_regular_replenishment_amount
    @bill.regular_replenishment_amount = regular_replenishment_amount
  end

  def set_expired_bill_at
    @bill.expired_bill_at = expired_bill_at
  end

  def set_early_close_status
    @bill.early_close_status = early_close_status
  end

  def set_amount_limit
    @bill.amount_limit = amount_limit
  end
end