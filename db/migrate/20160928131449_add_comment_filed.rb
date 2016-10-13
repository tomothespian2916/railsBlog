class AddCommentFiled < ActiveRecord::Migration
  def change
    add_column :blog_post_comments, :comment, :text
  end
end
