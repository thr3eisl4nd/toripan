class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cart_item

  with_options presence: true do
    validates :date, :time
  end
end
