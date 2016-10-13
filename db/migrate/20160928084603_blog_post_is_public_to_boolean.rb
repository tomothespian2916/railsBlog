class BlogPostIsPublicToBoolean < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :isPublic, :string
  end
end
