class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :username
      t.text :content

      t.timestamps
    end
  end
end
