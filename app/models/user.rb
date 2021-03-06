class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :avatar, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }
end
