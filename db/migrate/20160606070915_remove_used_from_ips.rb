class RemoveUsedFromIps < ActiveRecord::Migration
  def up
    remove_column :ips, :used
  end
end
