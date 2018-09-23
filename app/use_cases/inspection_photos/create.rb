module UseCases
  module InspectionPhotos
    class Create

      Request = Struct.new(:inspection_id, :photo_base_64, :caption, keyword_init: true)

      def initialize(request)
        @request = request
      end

      def call
        ::InspectionPhoto.create(inspection_photo_params)
      end

      private

      attr_reader :request

      def inspection_photo_params
        request
          .to_h
          .merge(photo_url: url_from_base_64(request.photo_base_64))
          .except(:photo_base_64)
      end

      def url_from_base_64(base_64)
        "http://chid.com/inspection/photo_#{base_64}"
      end
    end
  end
end
