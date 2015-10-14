class MatchesController < ApplicationController
  before_action :set_match, only: %i(show edit update destroy update_result)
  before_action :set_values, only: %i(edit new)
  def index
    @matches = Match.all
  end

  def show
  end

  def new
    @match = Match.new
  end

  def edit
  end

  def create
    if MatchService.create(params[:team_member])
      respond_to do |format|
        format.html { redirect_to matches_path, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created }
      end
    else
      respond_to do |format|
        format.html {
          render :new
        }
        format.json { render json: @match.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def update

    if @match.update_attributes(match_params)
      respond_to do |format|
        format.html { redirect_to matches_path, notice: 'Match was successfully updated.' }
        format.json { render json: @match, status: :created }
      end
    else
      edit
      render :edit
    end
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_path, notice: 'Match was successfully removed.' }
      format.json { render json: @match, status: :ok }
    end
  end

  def update_result
    MatchService.update_result(params[:match_result], @match)
    @result = MatchService.get_result(@match)
    respond_to do |format|
      format.json { render json: @result, status: :ok }
    end
  end

  private

  def set_values
    @users = User.all
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:team_1_id, :team_2_id)
  end
end