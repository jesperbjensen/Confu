class ShakesController < ApplicationController
  before_filter :require_profile, only: [:new]

  def new_request
    @code = current_user.shake_code
    @url = new_shake_url({code: @code})
  end

  # GET /shakes
  # GET /shakes.json
  def index
    @shakes = Shake.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shakes }
    end
  end

  # GET /shakes/1
  # GET /shakes/1.json
  def show
    @shake = Shake.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shake }
    end
  end

  # GET /shakes/new
  # GET /shakes/new.json
  def new
    @code = params[:code]

    user_id, email = @code.split('-')

    @source_user = User.find(user_id)

    unless email == @source_user.email
      raise "Not correct parameters"
    end

    if @source_user.id == current_user.id
      raise "Cannot scan yourself"
    end

    @shake1 = current_user.shakes.find_or_create_by_dest_user_id(@source_user.id)
    @shake2 = @source_user.shakes.find_or_create_by_dest_user_id(current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shake }
    end
  end

  # GET /shakes/1/edit
  def edit
    @shake = Shake.find(params[:id])
  end

  # POST /shakes
  # POST /shakes.json
  def create
    @shake = Shake.new(params[:shake])

    respond_to do |format|
      if @shake.save
        format.html { redirect_to @shake, notice: 'Shake was successfully created.' }
        format.json { render json: @shake, status: :created, location: @shake }
      else
        format.html { render action: "new" }
        format.json { render json: @shake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shakes/1
  # PUT /shakes/1.json
  def update
    @shake = Shake.find(params[:id])

    respond_to do |format|
      if @shake.update_attributes(params[:shake])
        format.html { redirect_to @shake, notice: 'Shake was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shakes/1
  # DELETE /shakes/1.json
  def destroy
    @shake = Shake.find(params[:id])
    @shake.destroy

    respond_to do |format|
      format.html { redirect_to shakes_url }
      format.json { head :no_content }
    end
  end
end
