class CreateMediaObjects < ActiveRecord::Migration
  def change
    create_table :media_objects do |t|
      t.string :image
      t.string :caption
      t.string :video
      t.string :content_type
      t.boolean :featured
      t.integer :work_id

      t.timestamps null: false
    end
  end
end
