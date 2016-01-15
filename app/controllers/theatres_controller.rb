class TheatresController < ApplicationController
  load_and_authorize_resource

  def index
    @theatres = Theatre.paginate(:page => params[:page],:per_page=>10)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @theatre.save
        flash[:notice] = "Theatre created successfully"
        format.html { redirect_to @theatre }
        format.json { render :show, status: :created, location: @theatre }
      else
        format.html { render :new }
        format.json { render json: @theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @theatre.update(theatre_params)
        flash[:notice] = "Theatre updated successfully"
        format.html { redirect_to @theatre }
        format.json { render :show, status: :ok, location: @theatre }
      else
        format.html { render :edit }
        format.json { render json: @theatre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @theatre.destroy
    respond_to do |format|
      flash[:notice] = "Theatre deleted successfully"
      format.html { redirect_to theatres_url }
      format.json { head :no_content }
    end
  end
  private
  def theatre_params
    params.require(:theatre).permit(:name, :address, :city)
  end
end
