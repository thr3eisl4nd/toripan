class Item < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :item_categories
  has_many :comments
  has_many :item_allergies
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1, message: 'can‘t be blank.'}
    validates :price, numericality: { greater_than_or_equal_to: 220, less_than_or_equal_to: 5000, message: 'is out of setting range.' }
    validates :stock
  end
end
