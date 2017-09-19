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

    private

    def list_params
      params.require(:list).permit(:description, :private)
    end

end
