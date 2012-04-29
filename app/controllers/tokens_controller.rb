class TokensController < ApplicationController
  before_filter :load_selectable_badges, only: [ :new, :edit, :update, :create]

  def index
    @tokens = Token.all
  end

  def show
    @token = Token.find(params[:id])
  end

  def new
    @token = Token.new
  end

  def edit
    @token = Token.find(params[:id])
  end

  def create
    @token = Token.new(params[:token])

    if @token.save
      redirect_to @token, notice: 'Token was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @token = Token.find(params[:id])

    if @token.update_attributes(params[:token])
      redirect_to @token, notice: 'Token was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @token = Token.find(params[:id])
    @token.destroy

    redirect_to tokens_url
  end

  private

  def load_selectable_badges
    @badges = Badge.all
  end
end
