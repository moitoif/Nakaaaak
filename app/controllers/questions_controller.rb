class QuestionsController < ApplicationController
  def index
    @question = Image.find_by(id: params[:id])
    # @comments = Comment.where(image_id: params[:id])

    @comments = User.joins(:comments).select("users.username, comments.comment, comments.comment_user_id, comments.image_id").where(comments: {image_id: params[:id]})

    render("questions/index")
  end

  def upload
    comment = Comment.new
    question = Question.new
    # image = Image.new

    comment.comment_user_id = current_user.id
    comment.comment = params[:comment]
    comment.image_id = params[:id]

    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to("/questions/#{params[:id]}")
    end

  end
end
