class BlogPostBelongsTo < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :user_id, :integer
  end
end
