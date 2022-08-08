module UsersHelper
  def user_img(user)
    user.photo.present? ? user.photo : 'https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'
  end
end
