class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   font = /\A[ぁ-んァ-ン一-龥]/
   font_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: font }
    validates :first_name, format: { with: font }
    validates :family_name_kana, format: { with: font_kana }
    validates :first_name_kana, format: { with: font_kana }
    validates :birthday
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }



  has_many :items
  has_many :purchases
  
end
