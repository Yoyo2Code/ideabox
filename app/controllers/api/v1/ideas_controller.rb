class Api::V1::IdeasController < ApplicationController
  respond_to :json

  def index
    render json: @ideas = Idea.all
  end

  def create
    render json: Idea.create(idea_params)
  end

  def update
    render json: Idea.update(params[:id], idea_params)
  end

  def destroy
    render json: Idea.delete(params[:id])
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body, :quality)
    end
end
