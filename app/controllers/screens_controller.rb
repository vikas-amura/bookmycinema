class ScreensController < ApplicationController
  before_action :set_screen, only: [:show, :edit, :update, :destroy]

  before_action :load_authorize_parent

  def index
    @screens = @theatre.screens.paginate(:page => params[:page],:per_page=>10)
  end

  def show
  end

  def new
    @screen = Screen.new
  end

  def edit
  end

  def create
    @screen = @theatre.screens.new(screen_params)
    respond_to do |format|
      if @screen.save
        flash[:notice] = "Screen created successfully"
        format.html { redirect_to theatre_screens_path(@theatre) }
        format.json { render :show, status: :created, location: @screen }
      else
        format.html { render :new }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @screen.update(screen_params)
        flash[:notice] = "Screen updated successfully"
        format.html { redirect_to theatre_screens_path(@theatre) }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @screen.destroy
    respond_to do |format|
      flash[:notice] = "Movie destroyed successfully"
      format.html { redirect_to theatre_screens_path(@theatre) }
      format.json { head :no_content }
    end
  end

  private
    def set_screen
      @screen = Screen.find(params[:id])
    end
  def screen_params
      params.require(:screen).permit(:name, :capacity)
    end

    def load_authorize_parent
      if params[:theatre_id].present?
        @theatre = Theatre.find(params[:theatre_id])
      end
    end
  end
