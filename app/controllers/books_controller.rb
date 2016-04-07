class BooksController < ApplicationController
  before_action :set_book, only: [:edit,:update,:delete,:remove,:show,:tranquility_cdn]
  before_action :set_author, only: [:create,:update]

  include BooksHelper
  layout 'application'
  def index
    @books=Book.all.paginate(:per_page=>5,:page => params[:page]).order('title ASC')
  end
  def show
    render 'show'
  end
  def manifest
    #get results
    #search results will be displayed here
    respond_to do |format|
      if params[:book][:isbn].present?
        @books=Book.where('isbn=?',params[:book][:isbn])
               .paginate(:per_page=>5,:page=>params[:page])

      #title and likes
      elsif params[:book][:title].present?
        @books=Book.where('title  LIKE ?',"%"+params[:book][:title]+"%").order('title ASC')
                   .paginate(:per_page=>5,:page=>params[:page])
        if params[:book][:author_id].present? #author is present
          @books=Book.where('title  LIKE ? and author_id = ?',"%"+params[:book][:title]+"%",params[:book][:author_id]).order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
          if params[:book][:category].present?
            @books=Book.where('title  LIKE ? and author_id = ? and category=?',
                              "%"+params[:book][:title]+"%",params[:book][:author_id],params[:book][:category]).order('title ASC')
                       .paginate(:per_page=>5,:page=>params[:page])
            if params[:book][:publisher].present?
              @books=Book.where('title  LIKE ? and author_id = ? and category=? and publisher LIKE ?',
                                "%"+params[:book][:title]+"%",params[:book][:author_id],params[:book][:category], "%"+params[:book][:publisher]+"%").order('title ASC')
                         .paginate(:per_page=>5,:page=>params[:page])
            end
          end
        elsif params[:book][:category].present?
          @books=Book.where('title  LIKE ? and category=?',"%"+params[:book][:title]+"%",params[:book][:category]).order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
          if params[:book][:publisher].present?
            @books=Book.where('title  LIKE ? and category=? and publisher LIKE ?',"%"+params[:book][:title]+"%",params[:book][:category],"%"+params[:book][:publisher]+"%").order('title ASC')
                       .paginate(:per_page=>5,:page=>params[:page])
          end
        elsif params[:book][:publisher].present?
          @books=Book.where('title  LIKE ? and publisher like ?',"%"+params[:book][:title]+"%","%"+params[:book][:publisher]+"%").order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
        end
      #author and likes
      elsif params[:book][:author_id].present?
        @books=Book.where('author_id = ?',params[:book][:author_id]).order('title ASC')
                   .paginate(:per_page=>5,:page=>params[:page])
        if params[:book][:category].present?
          @books=Book.where('author_id = ? and category=?',params[:book][:author_id],params[:book][:category]).order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
          if params[:book][:publisher].present?
            @books=Book.where('author_id = ? and category=? and publisher like ?',params[:book][:author_id],params[:book][:category],"%"+params[:book][:publisher]+"%").order('title ASC')
                       .paginate(:per_page=>5,:page=>params[:page])
          end
        end
      elsif params[:book][:category].present?
        @books=Book.where('category=?',params[:book][:category]).order('title ASC')
                   .paginate(:per_page=>5,:page=>params[:page])
        if params[:book][:publisher].present?
          @books=Book.where('category=? and publisher like ?',params[:book][:category],"%"+params[:book][:publisher]+"%").order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
        end
      elsif params[:book][:publisher].present?
        @books=Book.where("publisher like ?","%"+params[:book][:publisher]+"%").order('title ASC')
                   .paginate(:per_page=>5,:page=>params[:page])
      end
      format.html {render 'manifest'}
    end
  end
  def new
    @book=Book.new
  end

  def create
    @book=@author.books.create(book_params)
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

  def tranquility_cdn

  end

  def delete

  end
  def remove
    @index=params[:isbn]
    @book=@book.delete
  end
  def show_old
    @books=Book.all.paginate(:per_page=>5,:page => params[:page]).order('copyright DESC').limit(20)
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
    params.require(:book).permit :isbn,:title, :category,:publisher,
                                 :copyright,:description, :author_id
  end
  def set_author
    @author=Author.find_or_initialize_by(id: params[:book][:author_id])
  end
end
