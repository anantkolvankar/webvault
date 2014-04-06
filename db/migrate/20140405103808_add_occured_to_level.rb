class AddOccuredToLevel < ActiveRecord::Migration
  def change
    add_column :levels, :occured, :boolean, :default => false
  end
end
