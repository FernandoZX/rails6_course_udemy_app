# frozen_string_literal: true

# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  user_id    :bigint           not null
#  rating     :integer
#  price      :integer
#  review     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, :course, presence: true

  validates_uniqueness_of :user_id, scope: :course_id  # user cant be subscribed to the same course twice
  validates_uniqueness_of :course_id, scope: :user_id  # user cant be subscribed to the same course twice

  validate :cant_subscribe_to_own_course  # user can't create a subscription if course.user == current_user.id

  def to_s
    "#{user}  #{course}"
  end

  protected

  def cant_subscribe_to_own_course
    return unless new_record? && user_id.present? && (user_id == course.user_id)

    errors.add(:base, 'You can not subscribe to your own course')
  end
end
