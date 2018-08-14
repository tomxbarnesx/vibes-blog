class CreateTagConnections < ActiveRecord::Migration[5.2]
  def change

    create_table :tag_connections do |t|
      t.integer :vibe_id
      t.integer :tag_id
    end
  end
end
