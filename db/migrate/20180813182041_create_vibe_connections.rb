class CreateVibeConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :vibe_connections do |t|
      t.integer :vibe_id
      t.integer :post_id
    end
  end
end
