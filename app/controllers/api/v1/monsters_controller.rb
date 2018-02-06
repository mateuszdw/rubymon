class Api::V1::MonstersController < ApplicationController
  before_action :set_api_v1_monster, only: [:show, :update, :destroy]

  # GET /api/v1/monsters
  def index
    @api_v1_monsters = Monster.all

    render json: @api_v1_monsters
  end

  # GET /api/v1/monsters/1
  def show
    render json: @api_v1_monster
  end

  # POST /api/v1/monsters
  def create
    @api_v1_monster = Monster.new(api_v1_monster_params)

    if @api_v1_monster.save
      render json: @api_v1_monster, status: :created, location: @api_v1_monster
    else
      render json: @api_v1_monster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/monsters/1
  def update
    if @api_v1_monster.update(api_v1_monster_params)
      render json: @api_v1_monster
    else
      render json: @api_v1_monster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/monsters/1
  def destroy
    @api_v1_monster.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_monster
      @api_v1_monster = Monster.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_monster_params
      params.fetch(:api_v1_monster, {})
    end
end
