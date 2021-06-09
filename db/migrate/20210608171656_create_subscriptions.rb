class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true
      t.string :name
      t.boolean :status
      t.string :frequency
      t.integer :boxes

      t.timestamps
    end
  end
end
