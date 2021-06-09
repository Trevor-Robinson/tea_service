class SubscriptionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tea_id, :status, :frequency, :boxes
  attribute :tea_name do |object|
    "#{object.tea.name}"
  end
end
