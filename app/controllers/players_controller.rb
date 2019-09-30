class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
    authorize @player
  end

  def edit
    authorize @player
  end

  def create
    @player = Player.new(match_params)
    authorize @player

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @player

    respond_to do |format|
      if @player.update(match_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @player

    @player.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Player was successfully destroyed.' }
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def match_params
    params.require(:player).permit(:username)
  end
end
