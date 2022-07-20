class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  def show
    if params[:items_id]
      items = Item.find(params[:items_id])
      user = items.user
    else
      user = User.find_by(id: params[:id])
    end
    render json: user, include: :items
  end

private 

def resource_not_found
  render json: { error: "User not found" }, status: :not_found
end

end