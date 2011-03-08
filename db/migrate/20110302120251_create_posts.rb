class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :intro
      t.text :description
      t.text :body
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
