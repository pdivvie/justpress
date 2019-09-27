class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params.has_key?(:game_query)
      @game_query = Match.find_by_game_id(params[:game_query])
      @game_id = @game_query.game_id
      @matches = Match.all.where(game_id: @game_id)
    else
      @matches = Match.all
    end

    @players = Player.all
  end

  def show
  end

  def new
    @match = Match.new
  end

  def edit
    authorize @match
  end

  def create
    @match = Match.new(match_params)
    @match.user_id = current_user.id

    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_url, notice: 'Match was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @match

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to matches_url, notice: 'Match was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @match

    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
    end
  end

  private
  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:link, :game_id, { :player_ids => [] })
  end
end
