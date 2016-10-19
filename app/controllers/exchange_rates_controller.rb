class ExchangeRatesController < ApplicationController
  before_action :set_exchange_rate, only: [:show, :edit, :update, :destroy]

  def index
    @exchange_rates = ExchangeRate.first(100)
  end

  def show
  end

  def new
    @exchange_rate = ExchangeRate.new
  end

  def edit
  end

  def create
    @exchange_rate = ExchangeRate.new(exchange_rate_params)

    respond_to do |format|
      if @exchange_rate.save
        format.html { redirect_to @exchange_rate, notice: 'Exchange rate was successfully created.' }
        format.json { render :show, status: :created, location: @exchange_rate }
      else
        format.html { render :new }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @exchange_rate.update(exchange_rate_params)
        format.html { redirect_to @exchange_rate, notice: 'Exchange rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange_rate }
      else
        format.html { render :edit }
        format.json { render json: @exchange_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exchange_rate.destroy
    respond_to do |format|
      format.html { redirect_to exchange_rates_url, notice: 'Exchange rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def save
    ExchangeRate.save_data
    redirect_to exchange_rates_path
  end

  private
    def set_exchange_rate
      @exchange_rate = ExchangeRate.find(params[:id])
    end

    def exchange_rate_params
      params.require(:exchange_rate).permit(:period, :unit)
    end
end
