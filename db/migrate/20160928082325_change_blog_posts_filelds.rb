class ChangeBlogPostsFilelds < ActiveRecord::Migration
  def change
    rename_column :blog_posts, :post_text, :description
    rename_column :blog_posts, :roles, :isPublic
  end
end
