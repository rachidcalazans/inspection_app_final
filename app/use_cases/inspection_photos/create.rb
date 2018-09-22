module UseCases
  module InspectionPhotos
    class Create

      Request = Struct.new(:inspection_id, :photo_base_64, :caption, keyword_init: true)

      def initialize(request)
        @request = request
      end

      def call
        Struct.new('InspectionPhotoPresenter', :id, :inspection_id, :photo_url, :caption, keyword_init: true)
        request_params = request
          .to_h
          .merge(photo_url: url_from_base_64(request.photo_base_64))
          .except(:photo_base_64)

        inspection_photo = ::InspectionPhoto.create(request_params)

        presenter_params = inspection_photo
          .attributes
          .except('created_at', 'updated_at')

        Struct::InspectionPhotoPresenter.new(presenter_params)
      end

      private

      attr_reader :request

      def url_from_base_64(base_64)
        "http://chid.com/inspection/photo_#{base_64}"
      end
    end
  end
end
