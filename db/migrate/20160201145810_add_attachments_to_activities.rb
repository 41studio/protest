class AddAttachmentsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :attachments, :json
  end
end
