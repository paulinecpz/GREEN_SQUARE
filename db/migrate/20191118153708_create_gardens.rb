class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :address
      t.string :description
      t.integer :price_per_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
