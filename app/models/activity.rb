# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  description :text
#  status      :string
#  case_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attachments :json
#

class Activity < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :case
  belongs_to :user

  #
  # validations
  #
  validates :description, :status, presence: true

  #
  # additional configuration from system
  #
  mount_uploaders :attachments, AttachmentUploader

  attr_accessor :project_id, :test_id

  def project
    self.case.test.project
  end

  def test
    self.case.test
  end

end
