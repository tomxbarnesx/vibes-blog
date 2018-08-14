class CreatePosts < ActiveRecord::Migration[5.2]
  def change

    create_table :posts do |t|
      t.string :title
      t.string :song_uri
      t.string :post_body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
