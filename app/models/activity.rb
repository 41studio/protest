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

class Activity < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :case
  belongs_to :user
  belongs_to :user_test

  #
  # validations
  #
  validates :description, :status, :user_test_id, presence: true

  #
  # additional configuration from system
  #
  mount_uploaders :attachments, AttachmentUploader
end
