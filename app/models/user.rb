class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_cups, dependent: :destroy
  has_many :cups, through: :user_cups

  has_many :want_cups, dependent: :destroy
  has_many :wants_cups, through: :want_cups, source: :cup
  
end
