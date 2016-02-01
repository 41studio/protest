module ActivitiesHelper
  def row_activity_status(activity)
    row_class = if activity.status.eql? "Failed"
      "danger"
    elsif activity.status.eql? "Done"
      "success"
    else
      ""
    end
  end
end
