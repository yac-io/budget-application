require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe TransactionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    build(:transaction).attributes
  }

  let(:invalid_attributes) {
    build(:transaction_invalid).attributes
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionsController. Be sure to keep this updated too.
  let(:valid_session) {{}}

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET #show' do
    it 'returns a success response' do
      valid_attributes[:user_id] = @user.id
      transaction = Transaction.create! valid_attributes
      get :show, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      account = create(:account, user: @user)
      get :new, params: {account_id: account.id}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      valid_attributes[:user_id] = @user.id
      transaction = Transaction.create! valid_attributes
      get :edit, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Transaction' do
        expect {
          account = create(:account, user: @user)
          post :create, params: {transaction: valid_attributes, account_id: account.id}, session: valid_session
        }.to change(Transaction, :count).by(1)
      end

      it 'redirects to the created transaction' do
        account = create(:account, user: @user)
        post :create, params: {transaction: valid_attributes, account_id: account.id}, session: valid_session
        expect(response).to redirect_to(account_path(Transaction.last.account))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        account = create(:account, user: @user)
        post :create, params: {transaction: invalid_attributes, account_id: account.id}, session: valid_session
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'PUT #state' do
    before(:each) do
      request.headers['accept'] = 'application/json'
    end

    it 'marks as unchecked if checked' do
      valid_attributes[:user_id] = @user.id
      valid_attributes[:checked] = true
      transaction = Transaction.create! valid_attributes
      put :state, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      transaction.reload
      expect(transaction.checked?).to be_falsey
    end

    it 'marks as checked if unchecked' do
      valid_attributes[:user_id] = @user.id
      valid_attributes[:checked] = false
      transaction = Transaction.create! valid_attributes
      put :state, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      transaction.reload
      expect(transaction.checked?).to be_truthy
    end


  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {name: 'new_name'}
      }

      it 'updates the requested transaction' do
        valid_attributes[:user_id] = @user.id
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, account_id: transaction.account.id, transaction: new_attributes}, session: valid_session
        transaction.reload
        expect(transaction.name).to eq('new_name')
      end

      it 'redirects to the account summary' do
        valid_attributes[:user_id] = @user.id
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, account_id: transaction.account.id, transaction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(transaction.account)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        valid_attributes[:user_id] = @user.id
        transaction = Transaction.create! valid_attributes
        put :update, params: {id: transaction.to_param, account_id: transaction.account.id, transaction: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested transaction' do
      valid_attributes[:user_id] = @user.id
      transaction = Transaction.create! valid_attributes
      expect {
        delete :destroy, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      }.to change(Transaction, :count).by(-1)
    end

    it 'redirects to the account summarry' do
      valid_attributes[:user_id] = @user.id
      transaction = Transaction.create! valid_attributes
      delete :destroy, params: {id: transaction.to_param, account_id: transaction.account.id}, session: valid_session
      expect(response).to redirect_to(transaction.account)
    end
  end

end
