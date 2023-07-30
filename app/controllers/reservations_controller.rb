class ReservationsController < ApplicationController

  def index
    @rooms = current_user.rooms
    reservation_calculate
    @reservations = current_user.resevations
  end

  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:alert] = "オーナーが予約することはできません。"
    else
      @reservation = current_user.reservations.build(reservation_params)
      reservation_calculate
      @reservation.days = days
      @reservation.room = room
      @reservation.money = room.money
      @reservation.total = room.money * days * room.people
      @reservation.save
      flash[:notice] = "予約が完了しました。"
    end
      redirect_to :reservetions_confirm
  end

  def confirm
    room = Room.find(params[:room_id])
    reservation_calculate
    @reservation.days = days
    @reservation.room = room
    @reservation.money = room.money
    @reservation.total = room.money * days * room.people
  end

  private
    def reservation_calculate
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1
    
    end

    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :people)
    end
  end
