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

class UserTest < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :project, required: true

  #
  # validations
  #
  validates :email, :password, presence: true
end
