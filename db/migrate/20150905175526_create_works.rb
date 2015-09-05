class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.integer :min_year
      t.integer :max_year
      t.boolean :circa
      t.string :place
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
