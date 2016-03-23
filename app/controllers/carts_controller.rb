class CartsController < ApplicationController

  def index
    @carts=current_user.carts
  end

  def create
    @book=Book.find_by(isbn: params[:isbn])
    @cart=@book.carts.create(user_username: current_user.username)
      if @cart.save
         redirect_to books_path
      else
         redirect_to maintenance_welcome_path
      end
  end
  def delete
    cart=Cart.find_by(book_isbn: params[:isbn], user_username: current_user.username)
    cart.destroy()
    redirect_to books_path
  end
  def delmodal
    cart=Cart.find_by(book_isbn: params[:isbn], user_username: current_user.username)
    if cart.destroy()
      render plain: 'Item removed'
    else
      render plain: 'Item was not removed'
    end
  end
end
