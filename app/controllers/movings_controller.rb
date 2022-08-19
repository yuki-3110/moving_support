class MovingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_moving, only: %i[ show edit update destroy  ]

  def new
    @moving = Moving.new
  end

  def create
    respond_to do |format|
      @moving = current_user.movings.build(moving_params)
      if @moving.save
        format.html { redirect_to moving_url(@moving), notice: "moving was successfully created." }
        format.json { render :show, status: :created, location: @moving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movings/1 or /movings/1.json
  def update
    respond_to do |format|
      if @moving.update(moving_params)
        format.html { redirect_to moving_url(@moving), notice: "moving was successfully updated." }
        format.json { render :show, status: :ok, location: @moving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movings/1 or /movings/1.json
  def destroy
    @moving.destroy
    respond_to do |format|
      format.html { redirect_to movings_url, notice: "moving was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def show
  end

  def edit
  end

end
