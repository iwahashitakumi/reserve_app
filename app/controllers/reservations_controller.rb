class ReservationsController < ApplicationController

  def index
    @rooms = Room.find(params[:room_id])
    @reservations = current_user.reservations.all
    start_date = Date.parse(@reservations.start_date)
    end_date = Date.parse(params.require(:reservation).permit(:start_date, :end_date)[:end_date])
    days = (end_date - start_date).to_i + 1
    @reservations.days = days
    @reservations.room = @rooms
    @reservations.money = room.money
    @reservations.total = room.money * days * room.people
  end

  def create
    room = Room.find(params[:room_id])
    if current_user == room.user
      flash[:alert] = "オーナーが予約することはできません。"
    else
      @reservation = current_user.reservations.build(params.require(:reservation).permit(:start_date, :end_date, :people))
      reservation_calculate
      @reservation.days = days
      @reservation.room = room
      @reservation.money = room.money
      @reservation.total = room.money * days * room.people
      @reservation.save
      flash[:notice] = "予約が完了しました。"
    end
      redirect_to :reservations_confirm
  end

  def confirm
    room = Room.find(params[:room_id])
    reservation_calculate
    @reservation.days = days
    @reservation.room = room
    @reservation.money = room.money
    @reservation.total = room.money * days * room.people
  end

  
  end
