class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #
  # check whether user is the owner of the data - if not redirect it to another page
  #
  ["project", "test", "case", "activity", "user_test"].each do |mod|
    define_method "is_#{mod}_owner?" do
      message = "You don't have permission to do that action!"
      case mod
      when "project"
        redirect_to projects_url, alert: message unless @project.user.eql? current_user
      when "test"
        redirect_to project_path(@test.project), alert: message unless @test.user.eql? current_user
      when "case"
        redirect_to project_test_path(@case.test.project, @case.test), alert: message unless @case.user.eql? current_user
      when "activity"
        redirect_to project_test_case_path(@activity.case.test.project, @activity.case.test, @activity.case), alert: message unless @activity.user.eql? current_user
      when "user_test"
        redirect_to user_tests_url, alert: message unless @user_test.user.eql? current_user
      end
    end
  end
end
