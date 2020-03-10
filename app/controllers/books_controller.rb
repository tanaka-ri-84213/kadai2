class BooksController < ApplicationController

def top
  end

  def index
    @book = Book.new
    @books=Book.all

  end
  def show
    @book=Book.find(params[:id])

  end
   def create
        # ストロングパラメーターを使用

         @book = Book.new(book_params)
        # DBへ保存する
        if @book.save
          flash[:succees]="Book was successfully created."
          # トップ画面へリダイレクト
          redirect_to "/books/#{@book.id}"
        else
          @books=Book.all
          render 'index' #失敗の場合

        end
    end
    def edit
      @book=Book.find(params[:id])
    end
    def destroy
      book=Book.find(params[:id])
      book.destroy
      redirect_to books_path
    end
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:succees]="Book was successfully updated."
        redirect_to book_path(@book)
      else
          render 'edit' #失敗の場合
      end
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
