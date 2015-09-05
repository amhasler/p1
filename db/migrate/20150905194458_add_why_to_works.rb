class AddWhyToWorks < ActiveRecord::Migration
  def change
  	add_column :works, :why, :string
  end
end
