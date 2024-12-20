class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy monthly_view report export]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts
  end

  def monthly_view
    per_month_totals = @account.end_of_months_total

    labels = []
    data = []

    per_month_totals.each do |month, value|
      labels << month.strftime('%B %Y')
      data << value
    end

    render :json => {:labels => labels, :series => data}
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    month = params[:month].to_i unless params[:month].blank? || params[:month].to_i.zero?
    year = params[:year].to_i unless params[:year].blank? || params[:year].to_i.zero?

    month ||= Time.zone.now.month
    year ||= Time.zone.now.year
    @date = Time.zone.local(year, month, 1)
    @transactions = Transaction.includes(:category, :payment_mean).where('date >= ? and date <= ? and transactions.account_id = ?', @date.at_beginning_of_month.to_date, @date.at_end_of_month.to_date, @account.id).order('date desc, id asc')
  end

  def export
    @transactions = @account.transactions
  end

  # GET /accounts/1/report
  def report
    month = params[:month].to_i unless params[:month].blank? || params[:month].to_i.zero?
    year = params[:year].to_i unless params[:year].blank? || params[:year].to_i.zero?

    month ||= 1.year.ago.month
    year ||= 1.year.ago.year

    @date = Time.zone.local(year, month, 1)

    @expenses = Transaction.expenses(@account.id).joins(:category).where('date >= ?', @date.at_beginning_of_day.at_beginning_of_month)
    @incomes = Transaction.incomes(@account.id).joins(:category).where('date >= ?', @date.at_beginning_of_day.at_beginning_of_month)
    @transactions = Transaction.where('account_id = ?', @account.id).where('date >= ?',@date.at_beginning_of_day.at_beginning_of_month)
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @account.user = current_user
  end

  # GET /accounts/1/edit
  def edit;
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user = current_user

    respond_to do |format|
      if @account.save
        format.html {redirect_to @account, notice: 'Account was successfully created.'}
        format.json {render :show, status: :created, location: @account}
      else
        format.html {render :new}
        format.json {render json: @account.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html {redirect_to @account, notice: 'Account was successfully updated.'}
        format.json {render :show, status: :ok, location: @account}
      else
        format.html {render :edit}
        format.json {render json: @account.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html {redirect_to accounts_url, notice: 'Account was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = current_user.accounts.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:name, :currency, :account_type)
  end

  def filter_params
    params.require(:account).permit(':month')
  end

end
