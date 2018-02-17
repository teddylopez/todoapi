class Api::ItemsController < ApiController
  before_action :authenticated?
  respond_to :json, :html

  def index
    return permission_denied_error unless authenticated?
    items = Item.all
    render json: items, each_serializer: ItemSerializer
  end

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

  def destroy
    list = List.find(params[:id])
    item = Item.find(params[:id])

    if (user == list.user) && item.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 404
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :completed_at, :completed, :created_at, :updated_at)
  end
end
