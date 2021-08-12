class QuestionsController < ApplicationController
  def index
    @question = Image.find_by(id: params[:id])
    # @comments = User.joins(:comments).select("users.username, comments.comment, comments.comment_user_id, comments.image_id").where(comments: {image_id: params[:id]}).order(updated_at: "DESC")
    @comments = Comment.joins("LEFT JOIN images ON comments.comment_image_id = images.id INNER JOIN users ON users.id  = comments.comment_user_id").select("users.username, comments.comment, comments.comment_user_id, comments.comment_image_id, comments.id, comments.updated_at, images.filename").where(comments: {image_id: params[:id]}).order(updated_at: "DESC")


    render("questions/index")
  end

  def upload
    comment = Comment.new
    question = Question.new
    image = Image.new

    comment.comment_user_id = current_user.id
    comment.comment = params[:comment]
    comment.image_id = params[:id]
    comment.comment_image_id = Image.count + 1

    if params[:illust]
      image.filename = image.get_filename(current_user.id)
      directory_path = "public/users/#{current_user.id}/"
      File.binwrite(directory_path + image.filename, params[:illust].read)

      image.name = "イラストID#{params[:id]}コメント用"
      image.content = "イラストID#{params[:id]}コメント用"
      image.user_id = current_user.id

      image.save
    end

    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to("/questions/#{params[:id]}")
    else
      # render("questions/index")
      logger.debug("コメント投稿失敗")
    end

  end
end
