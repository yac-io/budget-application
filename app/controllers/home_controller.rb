class HomeController < ApplicationController
  def index
    @accounts = current_user.accounts
    render 'index'
  end
end
