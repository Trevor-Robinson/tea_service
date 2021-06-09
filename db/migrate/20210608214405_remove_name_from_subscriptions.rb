class RemoveNameFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :name, :string
  end
end
