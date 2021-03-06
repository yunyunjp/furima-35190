class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: {
                        greater_than_or_equal_to: 300,
                        less_than_or_equal_to: 9_999_999
                      }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :delivery_id
  end
end
