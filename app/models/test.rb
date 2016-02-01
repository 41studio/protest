# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  about      :string
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Test < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :project
  belongs_to :user
  has_many :cases, dependent: :destroy

  #
  # validations
  #
  validates :about, presence: true

  #
  # get case filter by type and status
  #
  def get_cases_by_type_and_status(type, status)
    type == "Happy Case" ? cases.happy_cases.select{|a| a.latest_status.eql? status} : cases.unhappy_cases.select{|a| a.latest_status.eql? status}
  end
end
