class CartsController < ApplicationController

  def index
    @carts=current_user.carts
  end

  def create
    @book=Book.find_by(isbn: params[:isbn])
    @cart=@book.carts.create(user_username: current_user.username)
    respond_to do |format|
      if @cart.save
        format.json {@cart}
        format.js {}
      else
        format.json {@cart}
        format.js {}
      end
    end
  end
  def destroy
  end

end
