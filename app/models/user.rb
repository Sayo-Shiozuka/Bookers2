class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # has_many :following_user, through: :follower, source: :followed
  # has_many :follower_user, through: :followed, source: :follower
  # has_many :followings, through: :relationships, source: :follow
  # has_many :followers, through: :passive_ralationships, source: :user

  has_many :relationships, foreign_key: "follower_id"
  has_many :followings, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, length: { in: 2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(followed_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(followed_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end


end
