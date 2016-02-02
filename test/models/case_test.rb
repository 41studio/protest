# == Schema Information
#
# Table name: cases
#
#  id              :integer          not null, primary key
#  scenario        :text
#  expected_result :text
#  test_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  case_type       :string
#  user_test_id    :integer
#  title           :string
#

require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
