class AddTitleToMediaObjects < ActiveRecord::Migration
  def change
    add_column :media_objects, :title, :String
  end
end
