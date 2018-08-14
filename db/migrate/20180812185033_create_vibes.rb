class CreateVibes < ActiveRecord::Migration[5.2]
  def change

    create_table :vibes do |t|
      t.string :name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end