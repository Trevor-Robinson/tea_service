class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions.all)
  end

  def create
    subscription = Subscription.create(subscription_params)
    render json: SubscriptionSerializer.new(subscription)
  end

  def update
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription.update(status: params[:status]))
  end

  private
  def subscription_params
    params.permit(:tea_id, :customer_id, :name, :status, :frequency, :boxes)
  end
end
