class Customer::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
  end

  def edit
  end

  private

  def address_params
  end

end
