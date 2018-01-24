class InvestmentsController < ApplicationController
  before_action :set_investment, only: %i[show edit update destroy]

  # GET /investments/1
  # GET /investments/1.json
  def show;
  end

  # GET /investments/new
  def new
    @investment = Investment.new
    @investment.user = current_user
    @investment.account = current_user.accounts.find(params[:account_id])
  end

  # GET /investments/1/edit
  def edit;
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    @investment.account = current_user.accounts.find(params[:account_id])

    respond_to do |format|
      if @investment.save
        format.html {redirect_to @investment.account, notice: 'Investment was successfully created.'}
        format.json {render :show, status: :created, location: @investment}
      else
        format.html {render :new}
        format.json {render json: @investment.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html {redirect_to @investment.account, notice: 'Investment was successfully updated.'}
        format.json {render :show, status: :ok, location: @investment}
      else
        format.html {render :edit}
        format.json {render json: @investment.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    @investment.destroy
    respond_to do |format|
      format.html {redirect_to @investment.account, notice: 'Investment was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_investment
    @investment = current_user.investments.find(params[:id])
    if @investment.account.id != params[:account_id].to_i
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def investment_params
    params.require(:investment).permit(:name, :isin, :quantity, :settlement_amount, :settlement_currency, :date, :account_id)
  end
end
