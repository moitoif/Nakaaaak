class QuestionsController < ApplicationController
  def index
    @question = Image.find_by(id: params[:id])
  end
end
