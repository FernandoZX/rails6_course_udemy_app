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
require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
