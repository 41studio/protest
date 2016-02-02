class CasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_case, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create, :update]
  before_action :is_case_owner?, only: [:edit, :update, :destroy]

  # GET /cases
  # GET /cases.json
  def index
    @cases = Case.all.page(params[:page]).per(10)
  end

  # GET /cases/1
  # GET /cases/1.json
  def show
    @activities = @case.activities
  end

  # GET /cases/new
  def new
    @case = Case.new
  end

  # GET /cases/1/edit
  def edit
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)
    @case.test_id = params[:test_id] if params[:test_id].present?

    respond_to do |format|
      if @case.save
        format.html { redirect_to project_test_case_path(@case.test.project, @case.test, @case), notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to project_test_case_path(@case.test.project, @case.test, @case), notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    test = @case.test
    @case.destroy
    respond_to do |format|
      format.html { redirect_to project_test_path(test.project, test), notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    def set_project
      @project = Project.friendly.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
      params.require(:case).permit(:scenario, :expected_result, :title, :test_id, :user_test_id, :case_type)
    end
end
