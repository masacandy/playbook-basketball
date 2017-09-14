class AddMovieIdToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :cources, :vimeo_id, :string, null: false, after: :description
    add_column :lessons, :vimeo_id, :string, null: false, after: :description
  end
end
