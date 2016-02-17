class BooksController < ApplicationController
  before_action :set_book, only: [:edit,:update,:destroy]

  include BooksHelper
  layout 'application'
  def index
    @books=Book.all.paginate(:per_page=>5,:page => params[:page]).order('created_at DESC')
  end

  def show
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.json {render json: @book}
        format.js {}
      else
        format.json {render json: @book}
        format.js {}
      end
    end
  end

  def edit
  end

  def update
    #render plain: params[:isbn]

    respond_to do |format|
      if @book.update(book_params)
        format.json {render json: @book}
        format.js {}
      else
        format.json {render json: @book}
        format.js {}
      end
    end
  end

  def destroy
  end

  def show_old
  end

  def show_new
  end

  def search
  end

  private
  def set_book
    @book=Book.find(params[:isbn])
  end
  def book_params
    params.require(:book).permit :isbn,:title,:author, :category,:publisher,
                         :copyright,:description
  end
end
