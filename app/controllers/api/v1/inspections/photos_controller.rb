module Api
  module V1
    module Inspections
      class PhotosController < ActionController::API

        def create
          render json: {}, status: 201
        end
      end
    end
  end
end
