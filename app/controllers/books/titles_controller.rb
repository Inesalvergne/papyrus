class Books::TitlesController < ApplicationController
  before_action :set_book
  before_action :authorize_admin!

  def edit; end

  def update
    if @book.update(title_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def title_params
    params.require(:book).permit(:title)
  end
end
