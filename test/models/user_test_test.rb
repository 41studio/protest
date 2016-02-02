# == Schema Information
#
# Table name: user_tests
#
#  id         :integer          not null, primary key
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

require 'test_helper'

class UserTestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
