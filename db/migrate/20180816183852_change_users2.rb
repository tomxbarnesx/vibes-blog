class ChangeUsers2 < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.string :bio, null: false, default: ""
    end
  end
end
