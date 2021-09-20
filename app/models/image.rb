class Image < ApplicationRecord 

  validates :name, 
    presence: true,
    length: { maximum: 40 }
  validates :content,
    presence: true,
    length: { maximum: 400 }
  validates :filename,
    presence: {message: "を選択してください" }

  belongs_to :comments, optional: true
  belongs_to :users, optional: true

  def get_filename(current_user_id)
    image = Image.where(user_id: current_user_id).maximum(:filename)

    if image.nil?
      return "#{Date.today.strftime("%Y%m%d")}0001.jpg"
    else
      image = image.delete(".jpg")
    end

    serial = image.to_i + 1

    return "#{serial}.jpg"
  end

  def get_illust_all(current_user_id)
    return Image.where(user_id: current_user_id).where(comment_flg: false).order(updated_at: :desc)
  end

  def get_illust(current_user_id, answer_flg)
    return Image.where(user_id: current_user_id).where(comment_flg: false).where(answer_flg: answer_flg).order(updated_at: :desc)
  end

end
