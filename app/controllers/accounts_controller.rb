class AccountsController < ApplicationController

  # def sign_in
  #   @title = "Accounts Sign In"
  # end

  def index
    @accounts = Account.all
    @title = "My Seller Accounts"
  end

  def show
    id = params[:id]
    @account = Account.find(id)
    @title = "#{@account.name} Info"
  end

  def new
    @account = Account.new()
    @action = "create"
    @title = "Add an Account"
  end

  def create
    Account.create(account_params[:account])
    redirect_to "/accounts"
  end

  def edit
    id = params[:id]
    @account = Account.find(id)
    @action = "update"
    @title = "Edit an Account"
  end

  def update
    id = params[:id]
    Account.update(id, account_params[:account])
    redirect_to "/accounts/#{id}"
  end

  def destroy
    id = params[:id]
    Account.destroy(id)
    redirect_to accounts_path
  end

  private

  def account_params
    params.permit(account:[:name, :user_login])
  end
end
