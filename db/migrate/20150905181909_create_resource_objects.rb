class CreateResourceObjects < ActiveRecord::Migration
  def change
    create_table :resource_objects do |t|
      t.string :title
      t.string :link
      t.string :description
      t.integer :work_id

      t.timestamps null: false
    end
  end
end
