class User < ApplicationRecord
  has_many :user_books
  has_many :reviews

  validates :username, :gender, :age, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: %w[Male Female Other] }
  validates :age, comparison: { greater_than_or_equal_to: 18 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
