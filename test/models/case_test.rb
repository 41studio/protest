# == Schema Information
#
# Table name: cases
#
#  id              :integer          not null, primary key
#  scenario        :text
#  expected_result :text
#  actual_result   :text
#  test_id         :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  case_type       :string
#

require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
