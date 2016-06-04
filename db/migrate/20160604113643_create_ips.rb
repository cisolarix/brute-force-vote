class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :address, null: false
      t.boolean :used, default: false
      t.timestamps null: false
    end
  end
end
