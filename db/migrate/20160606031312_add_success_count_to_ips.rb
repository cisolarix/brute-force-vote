class AddSuccessCountToIps < ActiveRecord::Migration
  def change
    add_column :ips, :success_count, :integer, default: 0
  end
end
