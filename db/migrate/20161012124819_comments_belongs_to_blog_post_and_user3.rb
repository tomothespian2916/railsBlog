class CommentsBelongsToBlogPostAndUser3 < ActiveRecord::Migration
  def change
    remove_column :blog_post_comments, :blog_post_id, :integer
  end
end
