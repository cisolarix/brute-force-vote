class AddFieldToIps < ActiveRecord::Migration
  def change
    add_column :ips, :failed_count, :integer, default: 0
  end
end
