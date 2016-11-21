# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  slug        :string
#

class Project < ActiveRecord::Base
  #
  # relations
  #
  belongs_to :user, required: true
  has_many :tests, dependent: :destroy
  has_many :user_tests, dependent: :destroy

  #
  # validations
  #
  validates :name, :repo_name, presence: true

  #
  # additional configuration from gem
  #
  extend FriendlyId
  friendly_id :name, use: :slugged
end
