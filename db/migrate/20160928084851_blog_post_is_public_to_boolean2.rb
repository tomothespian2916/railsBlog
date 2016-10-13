class BlogPostIsPublicToBoolean2 < ActiveRecord::Migration
  def change
    add_column :blog_posts, :isPublic, :boolean
  end
end
