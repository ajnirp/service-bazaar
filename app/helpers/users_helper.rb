module UsersHelper
  def vendor_appointments
    apps = []
    # current_user.listings.each do |l|
    #   if not l.appointment.nil?
    #     apps << l.appointment
    #   end
    # end
    current_user.services.each do |s|
      s.listings.each do |l|
        if not l.appointment.nil?
          apps << l.appointment
        end
      end
    end
    apps
  end
end
