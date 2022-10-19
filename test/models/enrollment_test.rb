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
require "test_helper"

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
