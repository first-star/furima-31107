class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'Input only number' }
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    SendingDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

  end