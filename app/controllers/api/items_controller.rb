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

    private

    def item_params
      params.require(:item).permit(:name, :completed_at)
    end
end
