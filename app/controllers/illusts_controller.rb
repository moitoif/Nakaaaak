class IllustsController < ApplicationController
  before_action :authenticate_user!

  def upload_form
    images = Image.new
    @current_user = current_user.id
  end

  def upload
    image = Image.new
    image.user_id = current_user.id
    image.name = params[:title]
    image.content = params[:caption]

    if params[:illust]
      # ファイル名は、「今日の日付+連番４桁」
      image.filename = image.get_filename(current_user.id)
      directory_path = "public/users/#{current_user.id}"

      # ディレクトリがあるかどうかチェック
      unless File.directory?(directory_path)
        # なかったらディレクトリを作成する。
        Dir.mkdir(directory_path)
      end
      File.binwrite("public/users/#{current_user.id}/#{image.filename}", params[:illust].read)
    end

    if image.save
      flash[:notice] = "投稿しました"
      redirect_to("/mypage")
    else
      render("illusts/upload_form")
    end
  end

  # 投稿イラスト編集
  def edit

  end

  def update

  end
end
