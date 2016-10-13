class User < ActiveRecord::Base
  has_many  :blog_posts, inverse_of: :user
  has_many  :blog_post_comments, inverse_of: :user

	validates :first_name, presence: {message: "can't be empty"} # validator with custom message
	validates :last_name, presence: true
	validates :email, presence: true
	validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/} #email validator
	validates :password, presence: true
	validates :password, length: { in: 6..20 } # password must be between 6 and 20 characters

  def full_name
    if !self.first_name.blank? || !self.last_name.blank?
    return self.first_name.to_s + " " + self.last_name
  end
end
end
