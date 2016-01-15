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
        format.html { redirect_to @theatre, notice: 'Theatre was successfully created.' }
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
        format.html { redirect_to @theatre, notice: 'Theatre was successfully updated.' }
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
      format.html { redirect_to theatres_url, notice: 'Theatre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end