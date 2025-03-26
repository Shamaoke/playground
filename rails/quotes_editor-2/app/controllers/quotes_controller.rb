
class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create

    @quote = Quote.new(params.expect(quote: [:name]))

    if @quote.save
      respond_to do |format|
        format.html do
          redirect_to quotes_path
        end
      end
    else
      render :new
    end
  end
end

