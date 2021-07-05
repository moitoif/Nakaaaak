class HomeController < ApplicationController
  def top
    @illusts = Image.order(updated_at: :desc).limit(5)
  end
end
