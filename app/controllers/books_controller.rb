class BooksController < ApplicationController
  before_action :set_book, only: [:edit,:update,:delete,:remove,:show]

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
        if params[:book][:author].present? #author is present
          @books=Book.where('title  LIKE ? and author LIKE ?',"%"+params[:book][:title]+"%","%"+params[:book][:author]+"%").order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
          if params[:book][:category].present?
            @books=Book.where('title  LIKE ? and author LIKE ? and category=?',
                              "%"+params[:book][:title]+"%","%"+params[:book][:author]+"%",params[:book][:category]).order('title ASC')
                       .paginate(:per_page=>5,:page=>params[:page])
            if params[:book][:publisher].present?
              @books=Book.where('title  LIKE ? and author LIKE ? and category=? and publisher LIKE ?',
                                "%"+params[:book][:title]+"%","%"+params[:book][:author]+"%",params[:book][:category], "%"+params[:book][:publisher]+"%").order('title ASC')
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
      elsif params[:book][:author].present?
        @books=Book.where('author  LIKE ?',"%"+params[:book][:author]+"%").order('title ASC')
                   .paginate(:per_page=>5,:page=>params[:page])
        if params[:book][:category].present?
          @books=Book.where('author  LIKE ? and category=?',"%"+params[:book][:author]+"%",params[:book][:category]).order('title ASC')
                     .paginate(:per_page=>5,:page=>params[:page])
          if params[:book][:publisher].present?
            @books=Book.where('author  LIKE ? and category=? and publisher like ?',"%"+params[:book][:author]+"%",params[:book][:category],"%"+params[:book][:publisher]+"%").order('title ASC')
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


  def delete

  end
  def remove
    @index=params[:isbn]
    @book=@book.delete
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
