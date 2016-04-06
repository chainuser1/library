module UsersHelper
  def find_dp
    if logged_in?
      user=User.find_by(username: current_user.username)
      photos=user.photos.order('updated_at DESC').limit(1)
      photos.each do |photo|
        return photo.attachment_url
      end
    else
      return nil
    end
  end
end
