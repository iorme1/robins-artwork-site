class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :date
      t.text :description
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
