# == Schema Information
#
# Table name: activities
#
#  id           :integer          not null, primary key
#  description  :text
#  status       :string
#  case_id      :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  attachments  :json
#  user_test_id :integer
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
