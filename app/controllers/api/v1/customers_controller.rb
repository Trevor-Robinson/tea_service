class Api::V1::CustomersController < ApplicationController
  def show
    data = Customer.find(params[:id])
    render json: CustomerSerializer.new(data)
  end
end
