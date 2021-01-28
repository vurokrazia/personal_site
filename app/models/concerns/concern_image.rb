class ConcernImage
  def self.path_image(type_image)
    if type_image.attached?
      if Rails.env.development?
        "#{ENV['URL_BASE']}#{Rails.application.routes.url_helpers.rails_blob_path(type_image, only_path: true)}"
      else
        "#{ENV['CLOUDFRONT_BUCKET']}/#{type_image.key}"
      end
    end
  end
end
