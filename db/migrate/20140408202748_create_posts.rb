class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :url
      t.string :title
      t.string :content
      t.timestamps
      t.references :user
    end
  end
end
