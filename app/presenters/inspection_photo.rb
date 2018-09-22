module Presenters
  class InspectionPhoto
    attr_reader :id, :inspection_id, :photo_url, :caption

    def initialize(inspection_photo)
      build_attrs(inspection_photo)
    end

    private

    attr_writer :id, :inspection_id, :photo_url, :caption

    def build_attrs(inspection_photo)
      inspection_photo
        .attributes
        .except('created_at', 'updated_at')
        .each do |attr|
        key, value = attr
        self.send("#{key}=", value)
      end
    end
  end
end
