class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @games = Game.all
  end

  def show
    @recent_vods = @game.matches.order('created_at DESC').limit(4)
  end

  def new
    @game = Game.new
    authorize @game
  end

  def edit
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    authorize @game

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @game

    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @game

    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :cover_image)
  end
end
