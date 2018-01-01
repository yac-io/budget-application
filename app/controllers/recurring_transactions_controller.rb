class RecurringTransactionsController < ApplicationController
  before_action :set_recurring_transaction, only: [:show, :edit, :update, :destroy, :disable, :enable]
  before_action :set_account


  # GET /recurring_transactions
  # GET /recurring_transactions.json
  def index
    @recurring_transactions = @account.recurring_transactions.all
  end

  # GET /recurring_transactions/1
  # GET /recurring_transactions/1.json
  def show
  end

  # GET /recurring_transactions/new
  def new
    @recurring_transaction = RecurringTransaction.new
    @recurring_transaction.account = @account
    @recurring_transaction.user = current_user
    @recurring_transaction.settlement_currency = @account.currency
    @recurring_transaction.recurring_rule = 'monthly'
  end

  # GET /recurring_transactions/1/edit
  def edit
  end

  # POST /recurring_transactions
  # POST /recurring_transactions.json
  def create
    @recurring_transaction = RecurringTransaction.new(recurring_transaction_params)
    @recurring_transaction.user = current_user
    @recurring_transaction.account = @account
    respond_to do |format|
      if @recurring_transaction.save
        format.html {redirect_to @recurring_transaction.account, notice: 'Recurring transaction was successfully created.'}
        format.json {render :show, status: :created, location: @recurring_transaction}
      else
        format.html {render :new}
        format.json {render json: @recurring_transaction.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /recurring_transactions/1
  # PATCH/PUT /recurring_transactions/1.json
  def update
    @recurring_transaction.user = current_user
    @recurring_transaction.account = @account
    respond_to do |format|
      if @recurring_transaction.update(recurring_transaction_params)
        format.html {redirect_to @recurring_transaction.account, notice: 'Recurring transaction was successfully updated.'}
        format.json {render :show, status: :ok, location: @recurring_transaction}
      else
        format.html {render :edit}
        format.json {render json: @recurring_transaction.errors, status: :unprocessable_entity}
      end
    end
  end

  def disable
    @recurring_transaction.active = false
    @recurring_transaction.save
    respond_to do |format|
      format.html {redirect_to account_recurring_transactions_path(@recurring_transaction.account), :notice => 'Recurring transaction was successfully disabled.'}
      format.json {head :no_content}
    end
  end

  def enable
    @recurring_transaction.active = true
    @recurring_transaction.save
    respond_to do |format|
      format.html {redirect_to account_recurring_transactions_path(@recurring_transaction.account), :notice => 'Recurring transaction was successfully enabled.'}
      format.json {head :no_content}
    end
  end

  # DELETE /recurring_transactions/1
  # DELETE /recurring_transactions/1.json
  def destroy
    @recurring_transaction.destroy!
    respond_to do |format|
      format.html {redirect_to account_recurring_transactions_path(@recurring_transaction.account), :notice => 'Recurring transaction was successfully removed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_account
    @account = current_user.accounts.find(params[:account_id])
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_recurring_transaction
    @recurring_transaction = RecurringTransaction.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recurring_transaction_params
    params.require(:recurring_transaction).permit(:recurring_rule, :account_id, :payment_mean_id, :category_id, :name, :settlement_currency, :settlement_amount, :user_id)
  end
end
