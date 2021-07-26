class QuestionsController < ApplicationController
  def index
    @question = Image.find_by(id: params[:id])
    render("questions/index")
  end
end
