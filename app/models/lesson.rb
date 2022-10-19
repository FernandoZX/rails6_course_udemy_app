# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  content    :text
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Lesson < ApplicationRecord
  belongs_to :course
  validates :title, :content, :course, presence: true
  has_rich_text :content

  extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

  def to_s
    title
  end
end
