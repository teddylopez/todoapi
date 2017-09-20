class Api::ListsController < ApiController
    before_action :authenticated?
    respond_to :json, :html

    def create
      user = User.find(params[:user_id])
      list = user.lists.build(list_params)

      if list.save
        render json: list, status: 201
      else
        render json: {}, status: 422
      end
    end

    def update
      list = List.find(params[:id])

      if list.update(list_params)
        render json: list
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      user = User.find(params[:user_id])
      list = List.find(params[:id])

      if (user == list.user) && list.destroy
        render json: {}, status: 204
      else
        render json: {}, status: 404
      end
    end

    private

    def list_params
      params.require(:list).permit(:description, :private)
    end

end
