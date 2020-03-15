class BillsController < ApplicationController
  before_action :set_bill, only: %i[show edit update destroy]
  before_action :authenticate_user!
  #after_action :verify_authorized
  # GET /bills
  # GET /bills.json
  def card_generator
    1.times do |i|
      random_numeric = [*('0'..'9')].sample(8).join
      date_now = Time.now.strftime("%e%m%Y").to_s
      card_number = date_now + random_numeric
      card_number = card_number.split('')
      first_block = card_number[0..-13]
      second_block = card_number[4..-9]
      third_block = card_number[8..-5]
      fourth_block = card_number[12..-1]
      x = first_block.join + " " + second_block.join + " " + third_block.join + " " + fourth_block.join
      return x << i, ' '
    end
  end
  def index
    #  if params[:user_id]
    #  @bills = Bill.where('user_id = ?', params[:user_id])
    #  user = User.find(params[:user_id])
    #  #authorize user
    # else
      @bills = Bill.all
      #authorize current_user
    #end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @transactions = Transaction.all
    user = User.find(@bill.user.id)
    #authorize user
  end

  # GET /bills/new
  def new
    @bill = Bill.new
      #@user = current_user
    #authorize @user
  end

  # GET /bills/1/edit
  def edit
    #authorize User
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
    respond_to do |format|
      if @bill.save
        format.html { redirect_to action: :index, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
      user = User.find(@bill.user_id)
      authorize user
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
      authorize User
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    transactions = Transaction.where("bill_id = ? or 'from' = ? or 'to' = ?", params[:id], params[:id], params[:id])
    transactions.each(&:destroy)
    # then destroy the account)
    bill.destroy
    authorize User
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bill
    @bill = Bill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bill_params
    params.require(:bill).permit(:user_id, :bill_type, :amount, :percent, :created_at, :updated_at, :close_at, :replanishment_at, :regular_replanishment_amount, :expired_bill_at, :early_close_status, :amount_limit)
  end
end
