class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
  end

  def new
    @character = Character.new
    authorize @character
  end

  def edit
    authorize @character
  end

  def create
    @character = Character.new(match_params)
    authorize @character

    respond_to do |format|
      if @character.save
        format.html { redirect_to characters_path, notice: 'Character was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @character

    respond_to do |format|
      if @character.update(match_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize @character

    @character.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Character was successfully destroyed.' }
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def match_params
    params.require(:character).permit(:title, :icon, :game_id)
  end
end

