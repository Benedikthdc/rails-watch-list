class ListsController < ApplicationController
  def index
    @list = List.new
    if params[:query].present?
      @lists = List.where("name LIKE ?", "%#{params[:query]}%")
    else
      @lists = List.all
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
