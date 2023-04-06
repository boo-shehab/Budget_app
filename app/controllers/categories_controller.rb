class CategoriesController < ApplicationController
  def index
    @group = current_user.groups.order('created_at DESC')
  end

  def show
    @group = current_user.groups.find(params[:id])
    @entities = @group.entities.order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user # assuming you have implemented authentication
    if @group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
