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

class Case < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :test, required: true
  belongs_to :user_test, required: true
  has_many :activities, dependent: :destroy

  #
  # validations
  #
  validates :scenario, :expected_result, :case_type, :test_id, presence: true

  #
  # scopes
  #
  scope :happy_cases, -> { where(case_type: 'Happy Case') }
  scope :unhappy_cases, -> { where(case_type: 'Unhappy Case') }

  def latest_status
    activities.last.present? == true ? activities.last.status : "New"
  end
end
