class Api::ItemsController < ApiController
  before_action :authenticated?
  respond_to :json, :html

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: {}, status: 422
    end
  end

  def update
    list = List.find(params[:id])
    item = Item.find(params[:id])

    if item.update(item_params)
      render json: item, status: 200
    else
      render json: {}, status: 422
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :completed_at, :completed)
  end
end
