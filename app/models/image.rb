class Image < ApplicationRecord 

  validates :name, 
    presence: true,
    length: { maximum: 40 }
  validates :content,
    presence: true,
    length: { maximum: 400 }
  validates :filename,
    presence: {message: "を選択してください" }

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
    return Image.where(user_id: current_user_id).order(updated_at: :desc)
  end
end
