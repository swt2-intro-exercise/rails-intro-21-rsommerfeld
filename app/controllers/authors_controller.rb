class AuthorsController < ApplicationController
  def index
    @authors = Author.all
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

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    # update the author, but always render the edit page again
    @author.update(author_params)
    render :edit
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
