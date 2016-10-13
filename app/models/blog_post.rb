class BlogPost < ActiveRecord::Base
  belongs_to :user, inverse_of: :blog_posts #inverse_of used for sincing 2 objects which is differen in memory
  has_many :blog_post_comments, inverse_of: :blog_post
end
