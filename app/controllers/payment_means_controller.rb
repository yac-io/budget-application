class PaymentMeansController < ApplicationController
  before_action :set_payment_mean, only: [:show, :edit, :update, :destroy]

  # GET /payment_means
  # GET /payment_means.json
  def index
    @payment_means = PaymentMean.all
  end

  # GET /payment_means/1
  # GET /payment_means/1.json
  def show
  end

  # GET /payment_means/new
  def new
    @payment_mean = PaymentMean.new
  end

  # GET /payment_means/1/edit
  def edit
  end

  # POST /payment_means
  # POST /payment_means.json
  def create
    @payment_mean = PaymentMean.new(payment_mean_params)

    respond_to do |format|
      if @payment_mean.save
        format.html { redirect_to @payment_mean, notice: 'Payment mean was successfully created.' }
        format.json { render :show, status: :created, location: @payment_mean }
      else
        format.html { render :new }
        format.json { render json: @payment_mean.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_means/1
  # PATCH/PUT /payment_means/1.json
  def update
    respond_to do |format|
      if @payment_mean.update(payment_mean_params)
        format.html { redirect_to @payment_mean, notice: 'Payment mean was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_mean }
      else
        format.html { render :edit }
        format.json { render json: @payment_mean.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_means/1
  # DELETE /payment_means/1.json
  def destroy
    @payment_mean.destroy
    respond_to do |format|
      format.html { redirect_to payment_means_url, notice: 'Payment mean was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_mean
      @payment_mean = PaymentMean.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_mean_params
      params.require(:payment_mean).permit(:name, :currency, :account_id)
    end
end
