module ApplicationHelper
  def find_reservation(reservations, day, time)
    reservations.find do |reservation|
      reservation.start_time.to_date == day &&
      reservation.start_time.strftime("%H:%M") == time
    end
  end
end
