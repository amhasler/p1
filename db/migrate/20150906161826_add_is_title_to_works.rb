class AddIsTitleToWorks < ActiveRecord::Migration
  def change
    add_column :works, :is_title, :boolean
  end
end
