class AppointmentsController < ApplicationController
  def new
    @listing = Listing.find(params[:listingid])
  end

  def edit
  end

  def create
    @appointment = Appointment.new(create_appo_params)
    @user = User.find(params[:userid])
    @listing = Listing.find(params[:listingid])

    # check if the appointment satisfies the required parameters
    price_valid = @appointment.price <= @listing.maxPrice && @appointment.price >= @listing.minPrice
    time_valid = @appointment.timeslot <= @listing.endingTime && @appointment.price >= @listing.startingTime
    date_valid = @appointment.date <= @listing.endDate && @appointment.price >= @listing.startDate

    if price_valid && time_valid && date_valid
      if @appointment.save
        @appointment.listing = @listing
        @appointment.user = @user

        @listing.appointments.push @appointment
        @user.appointments.push @appointment
        redirect_to '/'
      end
    else
      flash[:error] = "Could not create appointment: invalid price, date or time"
      redirect_to @listing
    end
  end

  def show
    @appointment = Appointment.find(request.original_url.split('/').last)
    @listing = @appointment.listing
    @user = @appointment.user

    # do not allow a user to view the appointment unless they are either
    #  a buyer or a vendor for that appointment
    if !((@user.id == current_user.id) || (@user.id != @listing.service.user.id))
      flash[:error] = "Error: You do not have permission to access this appointment"
      redirect_to '/'
    end
  end

  def confirm
    @appointment = Appointment.find(params[:appoid])
    @appointment.update_attributes(:isConfirmed => true)
    if @appointment.isConfirmed
      flash[:success] = "Appointment confirmed!"
      redirect_to '/'
    else
      redirect_to '/contact'
    end
  end

  private

  def new_appo_params
    params.require(:appt).permit(:listingid)
  end

  def create_appo_params
    params.require(:appointment).permit(:price, :date, :userid, :isConfirmed, :listingid, :timeslot)
  end

  def confirm_appo_params
    params.require(:appointment).permit(:appoid)
  end
end
