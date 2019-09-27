class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    if params.has_key?(:C1)
      @C1 = Character.find_by_title(params[:C1])
      @C1title = @C1.title
      @characters = Character.all.where(title: @C1title)
    else
      @characters = Character.all
    end

    @players = Player.all
  end

  def show
  end

  def new
    @character = Character.new
  end

  def edit
  end

  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
    end
  end

  private

    def set_character
      @character = Character.find(params[:id])
    end


    def character_params
      params.require(:character).permit(:title, :icon, :game_id, { :match_ids => [] })
    end
end
