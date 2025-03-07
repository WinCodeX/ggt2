class Business < ApplicationRecord
  belongs_to :user
  has_one_attached :logo

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
end
