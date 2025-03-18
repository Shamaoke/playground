
class QuotesController < ApplicationController

  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: 'Quote was successfully created.'
    else
      ## The `status: :unprocessable_entity` or `status: 422` part is needed to prevent the
      ## `Form responses must redirect to another location` error when
      ## trying to submit the form with an empty field.
      ##
      ## Details:
      ##
      ## • [Learn how to make a simple CRUD controller with Rails](https://www.hotrails.dev/turbo-rails/crud-controller-ruby-on-rails)
      ##
      ## • [Learn what role Turbo Drive plays in Hotwire and Rails](https://www.hotrails.dev/turbo-rails/turbo-drive)
      ##
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: 'Quote was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: 'Quote was successfully deleted.'
  end

  private
  def quote_params = params.require(:quote).permit(:name)

  def set_quote
    @quote = Quote.find_by(id: params[:id])
  end
end

