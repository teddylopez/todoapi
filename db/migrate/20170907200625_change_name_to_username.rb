class ChangeNameToUsername < ActiveRecord::Migration
  def self.up
    rename_column :users, :name, :username
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
