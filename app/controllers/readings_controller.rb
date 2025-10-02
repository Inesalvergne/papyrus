class ReadingsController < ApplicationController
  def create
    @reading = current_user.readings.new(reading_params)

    if @reading.save
      redirect_to book_path(@reading.book), notice: "Book added to your readings."
    else
      redirect_to book_path(@reading.book), alert: @reading.errors.full_messages.join("\n")
    end
  end

  private

  def reading_params
    params.require(:reading).permit(:book_id, :status)
  end
end
