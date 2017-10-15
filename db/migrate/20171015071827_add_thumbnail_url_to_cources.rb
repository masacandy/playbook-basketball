class AddThumbnailUrlToCources < ActiveRecord::Migration[5.1]
  def change
    add_column :cources, :thumbnail_url, :string, null: false, after: :vimeo_id
  end
end
