class Course < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: :slugged
  has_rich_text :description
  validates :title,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  def to_s
    title
  end
end
