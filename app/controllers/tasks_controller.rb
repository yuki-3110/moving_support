class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    # @have_to_task = have_to_tasks.find_by(task_id: @task.id)
    @tasks = Task.all.order(:position)
    @one_month_before_tasks = @tasks.all.where(deadline: 1)
    @fourteen_days_ago_tasks = @tasks.all.where(deadline: 2)
    @ten_days_ago_tasks = @tasks.all.where(deadline: 3)
    @one_week_before_tasks = @tasks.all.where(deadline: 4)
    @the_day_before_tasks = @tasks.all.where(deadline: 5)
    @moving_day_tasks = @tasks.all.where(deadline: 6)
    @after_a_week_tasks = @tasks.all.where(deadline: 7)
    @two_weeks_later_tasks = @tasks.all.where(deadline: 8)
    @one_month_later_tasks = @tasks.all.where(deadline: 9)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @memos = @task.memos
    @memo = @task.memos.build
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def move_higher
    Task.find(params[:id]).move_higher #move_higherメソッドでpositionを上に
    redirect_to action: :index
  end
  
  def move_lower
    Task.find(params[:id]).move_lower #move_lowerメソッドでpositionを下に
    redirect_to action: :index
  end

  def toggle
    head :no_content
    @task = Task.find(params[:id])
    @task.done = !@task.done
    @task.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :position, :done,  :question_id)
    end
end
