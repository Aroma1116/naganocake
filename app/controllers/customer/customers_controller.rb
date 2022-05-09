class Customer::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end

  end

  def unsubscribed
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_unsubscribed: true)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_kana, :last_kana, :postal_code, :address, :tel_number, :email)
  end
end
