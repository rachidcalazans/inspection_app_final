module Api
  module V1
    module Inspections
      class PhotosController < ActionController::API

        def create
          photo_request    = ::UseCases::InspectionPhotos::Create::Request.new(photo_params.to_h)
          use_case         = ::UseCases::InspectionPhotos::Create.new(photo_request)
          inspection_photo = use_case.call
          presenter        = ::Presenters::InspectionPhoto.new(inspection_photo)

          render json: presenter, status: 201
        end

        private

        def photo_params
          permitted_keys = %i[inspection_id photo_base_64 caption]
          params.permit(permitted_keys)
        end
      end
    end
  end
end
