class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string :title
        t.string :text
        t.string :author
        t.string :post_date
        t.string :photo_url
        t.references :user, index: true, foreign_key: true
    end
  end
end
