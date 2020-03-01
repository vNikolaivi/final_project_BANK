class CardsController < ApplicationController
  before_action :set_card, only: %i[show update new destroy]
  before_action :authenticate_user!

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

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    set_card
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to action: :index, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:id, :card_number, :security_type, :security_code, :expires_end)
  end
end
