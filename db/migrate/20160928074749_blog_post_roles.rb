class BlogPostRoles < ActiveRecord::Migration
  def change
    add_column :blog_posts, :roles, :string
  end
end
