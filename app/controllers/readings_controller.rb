class ReadingsController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @reading = Current.user.readings.new(reading_params)

    respond_to do |format|
      if @reading.save
        format.turbo_stream { render_status_turbo_stream(@reading.book) }
        format.html { redirect_to root_path, notice: "Reading created!" }
      else
        format.turbo_stream { render_status_turbo_stream(params[:reading][:book_id]) }
        format.html { redirect_to root_path, alert: @reading.errors.full_messages.join("\n") }
      end
    end
  end

  private

  def render_status_turbo_stream(book)
    render turbo_stream: turbo_stream.replace(
      dom_id(book, :status),
      partial: "books/status",
      locals: { book: book }
    )
  end

  def reading_params
    params.require(:reading).permit(:book_id, :status)
  end
end
