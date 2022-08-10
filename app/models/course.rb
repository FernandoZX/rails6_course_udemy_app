class Course < ApplicationRecord
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: :slugged
  has_rich_text :description
  validates :title, :short_description, :language, :price, :level,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  LANGUAGES = [:"English", :"Russian", :"Polish", :"Spanish"]
  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]

  def to_s
    title
  end
  
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
