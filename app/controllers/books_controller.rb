class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv do
        render plain: @books.generate_csv(@books), content_type: 'text/plain'
      end
      format.json do
        render json: @books
      end
    end
  end

end
