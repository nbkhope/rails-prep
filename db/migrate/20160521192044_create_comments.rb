class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # creates an integer column called article_id, an index for it, 
      # and a foreign key constraint that points to the articles table
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
