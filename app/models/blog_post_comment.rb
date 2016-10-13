class BlogPostComment < ActiveRecord::Base
  belongs_to :user, inverse_of: :blog_post_comments
  belongs_to :blog_post, inverse_of: :blog_post_comments
end
