class UserImage < ActiveRecord::Migration
  def change
    add_column :users, :user_logo, :string
  end
end
