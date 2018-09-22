module Api
  module V1
    module Inspections
      class PhotosController < ActionController::API

        def create
          Struct.new('InspectionPhotoPresenter', :id, :inspection_id, :photo_url, :caption, keyword_init: true)
          request_params = photo_params
            .merge(id: 11, photo_url: url_from_base_64(photo_params[:photo_base_64]))
            .except(:photo_base_64)
            .to_h

          inspection_photo = ::InspectionPhoto.create(request_params)

          presenter_params = inspection_photo
            .attributes
            .except('created_at', 'updated_at')
          presenter = Struct::InspectionPhotoPresenter.new(presenter_params)

          render json: presenter, status: 201
        end

        private

        def url_from_base_64(base_64)
          "http://chid.com/inspection/photo_#{base_64}"
        end

        def photo_params
          permitted_keys = %i[inspection_id photo_base_64 caption]
          params.permit(permitted_keys)
        end
      end
    end
  end
end
