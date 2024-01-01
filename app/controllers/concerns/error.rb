module Error
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do
      redirect_to cars_path, alert: t("common.not_found")
    end
  end
end