class ChangeUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.string :banner_url, null: false, default: ""
    end
  end
end