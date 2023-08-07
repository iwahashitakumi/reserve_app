class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @reservations = Reservation.all.includes(:room)
  end

  def create
    @room = Room.find(params[:room_id])
    if current_user == @room.user
      flash[:alert] = "オーナーが予約することはできません。"
    else
      @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total))
      @reservation.total = @reservation.sum_of_price
    end
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total))
    if @room.invalid? 
      redirect_to :rooms 
    end
    @reservation.days = @reservation.sum_of_days
    @reservation.total = @reservation.sum_of_price
    @reservation.save
  end
private

  def sum_of_days
    (start_date.to_date - end_date.to_date).to_i
  end
  
  def sum_of_price
    (room.price * people * sum_of_days).to_i
  end

  end
