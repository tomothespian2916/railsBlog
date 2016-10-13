class BlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string    :name
      t.integer   :owner
      t.text      :post_text
      t.timestamps :edited
      t.timestamps
    end
  end
end
