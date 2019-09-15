class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    if params.has_key?(:P1)
      @P1 = Player.find_by_username(params[:P1])
      @P1user = @P1.username
      @players = Player.all.where(username: @P1user)
    else
      @players = Player.all
    end
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(match_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(match_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Player was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:player).permit(:username, { :match_ids => [] }, :P1)
    end
end
