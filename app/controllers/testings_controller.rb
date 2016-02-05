class TestingsController < ApplicationController
  def index
    @activities = current_user.activities.page(params[:page]).per(10)
  end

  def new
    @activity = Activity.new
    @projects = current_user.projects.pluck(:name, :id)
    @tests = []
    @cases = []
  end

  def create
  end

  def update
  end

  def find_test
    project = Project.find(params[:project_id])
    @test = project.tests.select(:about, :id)
    render json: @test
  end

end
