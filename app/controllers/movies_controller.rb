class MoviesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    if params[:page].present?
      params[:page] = params[:page].to_i <= 0 ? 1 : params[:page]
    end
    @movies = Movie.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        flash[:notice] = "Movie created successfully"
        format.html { redirect_to @movie }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        flash[:notice] = "Movie updated successfully"
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      flash[:notice] = "Movie destroyed successfully"
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :language, :genre, :duration, :movie_format, :trailer_url, :rating, :release_date)
  end
end
