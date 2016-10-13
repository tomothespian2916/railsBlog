class CreateBlogPostComments < ActiveRecord::Migration
  def change
    create_table :blog_post_comments do |t|

      t.timestamps null: false
    end
  end
end
