# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                :bigint           not null, primary key
#  title             :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#  slug              :string
#  short_description :text
#  language          :string           default("English"), not null
#  level             :string           default("Beginner"), not null
#  price             :integer          default(0), not null
#
class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :enrollments
  friendly_id :title, use: :slugged
  has_rich_text :description
  tracked owner: proc { |controller, _model| controller.current_user }
  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  LANGUAGES = %i[English Russian Polish Spanish].freeze
  LEVELS = %i[Beginner Intermediate Advanced].freeze

  def to_s
    title
  end

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end

  def bought(user)
    enrollments.where(user_id: [user.id], course_id: [id].empty?)
  end
end
