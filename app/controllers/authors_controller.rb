class AuthorsController < ApplicationController
  def index
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    # save the author but always render the new page again
    @author.save
    render :new
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
