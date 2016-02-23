class TestingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  
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
    @activity = Activity.new(activity_params)
    @activity.user_id = current_user.id

    respond_to do |format|
      if @activity.save
        format.html { redirect_to testing_path(@activity), notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @activity.project_id = @activity.project.id
    @activity.test_id = @activity.test.id

    @projects = current_user.projects.pluck(:name, :id)
    @tests = Test.where(project_id: @activity.project_id).pluck(:about, :id)
    @cases = Case.where(test_id: @activity.test_id).pluck(:title, :id)
  end

  def update
  end

  def find_test
    project = Project.find(params[:project_id])
    @test = project.tests.select(:about, :id)
    render json: @test
  end

  def find_case
    test = Test.find(params[:test_id])
    @case = test.cases.select(:title, :id)
    render json: @case
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:description, :status, :case_id, {attachments: []})
    end

end
