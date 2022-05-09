class Customer::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_kana, :last_kana, :postal_code, :address, :tel_number, :email)
  end
end
