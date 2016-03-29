class TasksController < ApplicationController
  def show_reservations
     @carts=Cart.all.paginate(:per_page=>5,:page => params[:reservations]).order('created_at DESC')
  end
  def show_all_users
     @users=User.all.paginate(:per_page=>5,:page => params[:users]).order('username ASC')
  end
end
