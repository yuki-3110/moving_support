class MemosController < ApplicationController
  before_action :set_task, only: [:create, :edit, :update]
  
  def create
    # taskをパラメータの値から探し出し,taskに紐づくmemosとしてbuildします。
    # @task = task.find(params[:task_id])
    @memo = @task.memos.build(memo_params)
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      binding.irb
      if @memo.save
        format.js { render :index }
      else
        format.html { redirect_to task_path(@task), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @memo = @task.memos.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @memo = @task.memos.find(params[:id])
      respond_to do |format|
        if @memo.update(memo_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

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
    params.require(:memo).permit(:content, :user_id)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end

