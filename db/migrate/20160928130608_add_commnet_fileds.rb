class AddCommnetFileds < ActiveRecord::Migration
  def change
    add_column :blog_post_comments, :blog_post_id, :integer
    add_column :blog_post_comments, :comment_owner_id, :integer
  end
end
