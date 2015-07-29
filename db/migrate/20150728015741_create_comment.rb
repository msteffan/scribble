class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.string :author
        t.string :comment_text
        t.string :post_date
        t.references :post, index: true, foreign_key: true
    end
  end
end
