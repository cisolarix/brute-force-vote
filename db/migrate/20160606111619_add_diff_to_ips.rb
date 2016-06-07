class AddDiffToIps < ActiveRecord::Migration
  def change
    add_column :ips, :diff, :integer, default: 0
  end
end
