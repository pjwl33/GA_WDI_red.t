class Post < ActiveRecord::Base
  belongs_to :user

  validates :url, :title, :user_id, presence: true
  validates :url, uniqueness: true

end
