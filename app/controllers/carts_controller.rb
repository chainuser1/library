class CartsController < ApplicationController

  def index
    @carts=current_user.carts
  end

  def create
    @book=Book.find_by(isbn: params[:isbn])
    @cart=@book.carts.create(user_username: current_user.username)
    respond_to do |format|
      if @cart.save
        format.html {redirect_to books_path}
        format.json {@cart}
      else
        format.html {redirect_to maintenance_welcome_path}
        format.json {@cart}
      end
    end
  end
  def delete
    cart=Cart.find_by(book_isbn: params[:isbn], user_username: current_user.username)
    cart.destroy()
    redirect_to books_path
  end

end
