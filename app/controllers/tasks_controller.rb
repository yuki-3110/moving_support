class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    # @have_to_task = have_to_tasks.find_by(task_id: @task.id)
    # @tasks = current_user.tasks
    # @tasks =Task.where(moving: Moving.where(user: current_user).order(moving_day: :desc).first)
    # @tasks =Task.where(moving: Moving.where(user: current_user).order(moving_day: :desc).first)

    # @tasks =Task.where(moving_id: params[:moving_id]).where(moving: Moving.where(user: current_user).order(moving_day: :desc).first).order(:position)

    @tasks =Task.where(moving: Moving.where(user: current_user).order(moving_day: :desc).first).order(:position)
    # @moving = Moving.find(params[:moving_id])
    # @tasks = Task.where(moving_id: params[:moving_id]).order(:position)
    

    # @user = User.find(params[:user_id])
    # @posts = Post.where(user_id: params[:user_id]).order(:position)


    # @user = User.find(params[:id])

    # @tasks = current_user.tasks(moving: Moving.order(moving_day: :desc).first)
    # @tasks = Task.all.order(:position)
    @one_month_before_tasks = @tasks.all.where(deadline: 1)
    @fourteen_days_ago_tasks = @tasks.all.where(deadline: 2)
    @ten_days_ago_tasks = @tasks.all.where(deadline: 3)
    @one_week_before_tasks = @tasks.all.where(deadline: 4)
    @the_day_before_tasks = @tasks.all.where(deadline: 5)
    @moving_day_tasks = @tasks.all.where(deadline: 6)
    @after_a_week_tasks = @tasks.all.where(deadline: 7)
    @two_weeks_later_tasks = @tasks.all.where(deadline: 8)
    @one_month_later_tasks = @tasks.all.where(deadline: 9)
    # @moving = @tasks.movings.order(moving_day: :desc).first
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
    # @task = Task.new(task_params)
    #
    #Moving.first
    #Task.first.moving
    #Task.create(moving: Moving.first, title: "hogehoge") 1つ目のmovingに対して、titleを作成
    #誤った場合の表示、Task.create(moving: "2022-09-27", title: "hogehoge")

    #先に、タスクに紐づけたい引越日を取得した上で、タスクを作成
    #Moving.first.tasks
    @task = Moving.find_by(user: current_user, moving_day: params[:task][:moving_day]).tasks.build(task_params)
    #コントローラーはviewで送られた内容の引越を探す
    #同じユーザーが同じ引越日を設定している場合、whereは全て取得。find_byはその引越日に該当する引越のインスタンスを取得する
    #buildは、newのエイリアス（アソシエーションの場合は、関連づけてる意味合いをわかりやすくするために、使用）


    #自分の引越日の情報を取得する場合、session[:moving_id] = @task.moving.id
    # @task = Moving.find(session[:moving_id]).tasks.build(task_params)
    #session[:moving_id] #=>　2 Moving.find(2)
    #Moving.find_by(id: 2)でも同じだけど、記述が長くなるので、却下
    # binding.irb
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "タスクの登録に成功しました" }
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
        format.html { redirect_to task_url(@task), notice: "タスクの編集に成功しました" }
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
      format.html { redirect_to tasks_url, notice: "タスクの削除に成功しました" }
      format.json { head :no_content }
    end
  end

  def move_higher
    Task.find(params[:id]).move_higher #move_higherメソッドでpositionを上に
    # Task.where(moving: Moving.where(user: current_user).order(moving_day: :desc).first).find(params[:id]).move_higher
    redirect_to action: :index
  end
  
  def move_lower
    Task.find(params[:id]).move_lower #move_lowerメソッドでpositionを下に
    # Task.where(moving: Moving.where(user: current_user).order(moving_day: :desc).first).find(params[:id]).move_lower
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
      params.require(:task).permit(:title, :content, :deadline, :position, :done, :moving_id,  :question_id)
    end
end
