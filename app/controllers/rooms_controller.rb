class RoomsController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[top]
 def index
  @users = current_user
  @rooms = @users.rooms.all
 end
 def new
  @user = current_user
  @room = @user.rooms.new
 end
 def create
  @user = current_user
  @room = @user.rooms.new(params.require(:room).permit(:home_name, :address, :home_type, :money, :home_image))
   if @room.save
     redirect_to :rooms_index, notice: "保存しました。"
   else
     flash[:alert] = "問題が発生しました。"
     redirect_to :rooms_index
   end
  end

 def show
  @reservation = Reservation.new
  @room = Room.find(params[:id])
 end

 def edit
  @room = Room.find(params[:id])
 end

 def update
  @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:home_name, :address, :home_type, :money, :home_image))
       flash[:notice] = "ルームIDが「#{@room.id}」の情報を更新しました"
       redirect_to :rooms_index
     else
       flash[:false] = "予定の登録に失敗しました。"
       redirect_to :rooms_index
     end
 end

 def destroy
  @room = Room.find(params[:id])
     @room.destroy
     flash[:notice] = "予定を削除しました"
     redirect_to :rooms_index
 end

 def search
  @user = current_user.id
  @q = Room.ransack(params[:q])
  @rooms = @q.result(distinct: true)
 end

 def top
  @q = Room.ransack(params[:q])
  @rooms = @q.result(distinct: true)
 end

end
