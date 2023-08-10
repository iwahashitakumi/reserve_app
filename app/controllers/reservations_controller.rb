class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @reservations = Reservation.all.includes(:room)
  end

  def new
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
      @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
      if @reservation.save
        redirect_to reservations_path
      else
        redirect_to room_path(@room), alert: "予約できてません"
      end
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    if @room.invalid? 
      redirect_to :rooms 
    end
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
  end

  end
