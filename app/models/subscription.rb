class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  def self.include_tea_names
    binding.pry
  end
end
