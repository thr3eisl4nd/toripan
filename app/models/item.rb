class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :item_categories
  has_many :comments
  has_many :item_allergies
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name, length: { minimum: 3, maximum: 20 }
    validates :text, length: { maximum: 256 }
    validates :category_id, numericality: { other_than: 1, message: 'can‘t be blank.'}
    validates :price, numericality: { greater_than_or_equal_to: 220, less_than_or_equal_to: 5000, message: 'is out of setting range.' }
    validates :stock
  end
end
