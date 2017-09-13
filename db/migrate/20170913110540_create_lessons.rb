class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.integer :cource_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :sort, null: false, default: 0
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :lessons, %i(cource_id active)
    add_index :lessons, :sort
  end
end
