class AddTitleToMediaObjects < ActiveRecord::Migration
  def change
    add_column :media_objects, :title, :string
  end
end
