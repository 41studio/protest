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
  belongs_to :case, required: true
  belongs_to :user, required: true

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

  def create_issue_on_github(token)
    repo_name = self.project.repo_name || 'protest'
    issues = Github::Client::Issues.new(user: '41studio', repo: repo_name, oauth_token: token)
    issues.create(title: self.case.title, body: self.description, labels: ["bug"])
  end

end
