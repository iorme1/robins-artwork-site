class AddVisibleToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :visible, :boolean
  end
end
