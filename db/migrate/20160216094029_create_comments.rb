class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :username
      t.text :content
      t.date :datestamp
      t.integer :post_id
    end
  end
end
