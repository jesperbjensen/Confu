class BadgesController < ApplicationController
  
  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def new
    @badge = Badge.new
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def create
    @badge = Badge.new(params[:badge])

    if @badge.save
      redirect_to @badge, notice: 'Badge was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @badge = Badge.find(params[:id])

    if @badge.update_attributes(params[:badge])
      redirect_to @badge, notice: 'Badge was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy

    redirect_to badges_url
  end
  
end
