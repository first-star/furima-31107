class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase
  has_one_attached :image



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :prepare
  belongs_to_active_hash :condition



  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :condition
    validates :category
    validates :postage
    validates :prefecture
    validates :price
    validates :prepare
  end
  

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prepare_id
    validates :prefecture_id
  end


  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }



end
