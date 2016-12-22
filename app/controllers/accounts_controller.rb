class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

def new_deposit
    @accounts = Account.find(params[:id])

end 
  
  def new_deposit
  case [deposit]
   when [[Float,String],Float] 
      puts "#{deposit[0]} #{deposit[1]}, #{apr*100.0}% APR"
    when [[nil,String],Float] 
      puts "#{apr*100.0}% APR on deposits greater than 100 #{deposit[1]}"
    when [[Float,String],nil] 
      puts "#{deposit[0]} #{deposit[1]}"
    else 
      puts 'N/A' 
  end
  end
  #=============================================
  def new_withdrawal 
    @account =Account.find(params[:id])
  end 
  
  def create withdrawal
    @account =Account.find(params[:id])
    
    if withdrawal_params [:amount].to_f  <= 1000 &&@account.withdrawal(withdrawal_params)
      @account.transactions.creat!(amount:withdrawal_params[:amount], atm_banks_id: session[:my_atm])
      redirect_to atm_banks_path(session[:my_atm])
    else
      render :new_withdrawal
    end 
  end   

#=========
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:account_no, :balance, :user_id, :user_id)
    end 
end