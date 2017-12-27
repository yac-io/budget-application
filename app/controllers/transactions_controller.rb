class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :state]

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @transaction.user = current_user
    @transaction.account = current_user.accounts.find(params[:account_id])
  end

  # GET /transactions/1/edit
  def edit
  end

  def state
    @transaction.checked = !@transaction.checked?
    respond_to do |format|
      if @transaction.save
        format.json {render :show, status: :ok, location: account_transaction_path(@transaction.account, @transaction)}
      else
        format.json {render json: @transaction.errors, status: :unprocessable_entity}
      end
    end
  end


  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user

    respond_to do |format|
      if @transaction.save
        format.html {redirect_to @transaction.account, notice: 'Transaction was successfully created.'}
        format.json {render :show, status: :created, location: @transaction}
      else
        format.html {render :new}
        format.json {render json: @transaction.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html {redirect_to account_path(@transaction.account), notice: 'Transaction was successfully updated.'}
        format.json {render :show, status: :ok, location: @transaction}
      else
        format.html {render :edit}
        format.json {render json: @transaction.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html {redirect_to @transaction.account, notice: 'Transaction was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = current_user.transactions.find(params[:id])
    if @transaction.account.id != params[:account_id].to_i
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:account_id, :payment_mean_id, :category_id, :currency, :name, :amount, :settlement_currency, :settlement_amount, :date)
  end
end
