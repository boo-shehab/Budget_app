class TransactionsController < ApplicationController
    def new
        @groups = current_user.groups
        @group = Group.find(params[:category_id])
        @entity = @group.entities.new
    end
  
    def create
        @group = Group.find(params[:category_id])
        @entity = Entity.new(entity_params.merge(author: current_user))
        if @entity.save
          redirect_to category_path(@group)
        else
          render 'new'
        end
    end
  
    private
  
    def entity_params
        params.require(:entity).permit(:name, :amount, :group_id)
    end
  end
  