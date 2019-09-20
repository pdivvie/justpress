module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.username = "Guest User"
    guest.email = "guest@example.com"
    guest
  end
end