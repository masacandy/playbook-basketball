class CreateCources < ActiveRecord::Migration[5.1]
  def change
    create_table :cources do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :category_id, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :cources, :category_id
    add_index :cources, :active
  end
end
