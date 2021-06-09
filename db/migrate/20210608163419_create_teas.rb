class CreateTeas < ActiveRecord::Migration[6.0]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.string :temperature
      t.string :brew_time
      t.float :price

      t.timestamps
    end
  end
end
