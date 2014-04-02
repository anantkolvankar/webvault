class AddLevelIdToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :level_id, :integer
  end
end
