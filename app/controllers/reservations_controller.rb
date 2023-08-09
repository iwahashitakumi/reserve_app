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
    if current_user == @room.user
      flash[:alert] = "オーナーが予約することはできません。"
    else
      @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
      @reservation.total = @reservation.room.money * @reservation.people * (@reservation.end_date.to_date + 1.day - @reservation.start_date.to_date ).to_i
      if @reservation.save
        redirect_to reservations_path
      end
    end
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :total, :user_id, :room_id))
    if @room.invalid? 
      redirect_to :rooms 
    end
    @reservation.total =  @reservation.room.money * @reservation.people * (@reservation.end_date.to_date - @reservation.start_date.to_date ).to_i
  end

  end
