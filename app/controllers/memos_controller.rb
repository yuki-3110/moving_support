class MemosController < ApplicationController
  before_action :set_task, only: [:create, :edit, :update]
  
  def create
    # taskをパラメータの値から探し出し,taskに紐づくmemosとしてbuildします。
    # @task = task.find(params[:task_id])
    @memo = @task.memos.build(memo_params)
    @memo.user_id = current_user.id
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      # binding.irb
      if @memo.save
        format.js { render :index }
      else
        flash.now[:notice] = '100字以内の文字数で入力してください'
        format.js { render :index }
      end
    end
  end

  # respond_to do |format|
  #   if @task.save
  #     format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
  #     format.json { render :show, status: :created, location: @task }
  #   else
      


  # def edit
  #   @memo = @task.memos.find(params[:id])
  #   respond_to do |format|
  #     flash.now[:notice] = 'コメントの編集中'
  #     format.js { render :edit }
  #   end
  # end

  # def update
  #   @memo = @task.memos.find(params[:id])
  #     respond_to do |format|
  #       if @memo.update(memo_params)
  #         flash.now[:notice] = 'コメントが編集されました'
  #         format.js { render :index }
  #       else
  #         flash.now[:notice] = 'コメントの編集に失敗しました'
  #         format.js { render :edit }
  #       end
  #     end
  # end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  # ストロングパラメーター
  def memo_params
    params.require(:memo).permit(:content)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end

