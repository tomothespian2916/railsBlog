class BlogPostBelongsTo2 < ActiveRecord::Migration
  change_table :blog_posts do |t|
    t.belongs_to :user, index: true
  end
end
