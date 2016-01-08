class ScreensController < ApplicationController
  before_action :set_screen, only: [:show, :edit, :update, :destroy]

  before_action :load_authorize_parent

  # GET /screens
  # GET /screens.json
  def index
    @screens = @theatre.screens.all
  end

  # GET /screens/1
  # GET /screens/1.json
  def show
  end

  # GET /screens/new
  def new
    @screen = Screen.new
  end

  # GET /screens/1/edit
  def edit
  end

  # POST /screens
  # POST /screens.json
  def create
    @screen = @theatre.screens.new(screen_params)
    respond_to do |format|
      if @screen.save
        format.html { redirect_to edit_theatre_screen_path(@theatre,@screen), notice: 'Screen was successfully created.' }
        format.json { render :show, status: :created, location: @screen }
      else
        format.html { render :new }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screens/1
  # PATCH/PUT /screens/1.json
  def update
    respond_to do |format|
      if @screen.update(screen_params)
        format.html { redirect_to edit_theatre_screen_path(@theatre,@screen), notice: 'Screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screens/1
  # DELETE /screens/1.json
  def destroy
    @screen.destroy
    respond_to do |format|
      format.html { redirect_to theatre_screens_path(@theatre), notice: 'Screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen
      @screen = Screen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screen_params
      params.require(:screen).permit(:name, :capacity)
    end

    def load_authorize_parent
      if params[:theatre_id].present?
        @theatre = Theatre.find(params[:theatre_id])
      end
    end
  end
