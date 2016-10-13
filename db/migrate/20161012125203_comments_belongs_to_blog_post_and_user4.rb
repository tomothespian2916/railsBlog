class CommentsBelongsToBlogPostAndUser4 < ActiveRecord::Migration
  change_table :blog_post_comments do |t|
    t.belongs_to :blog_post, index: true
  end
end
