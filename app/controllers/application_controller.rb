class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CarrierWave::DownloadError, :with => :carrierwave_download_error
  rescue_from CarrierWave::IntegrityError, :with => :carrierwave_integrity_error
  before_action :set_section_name

  protected
  def carrierwave_download_error
    flash[:error] = "There was an error trying to download that remote file for upload. Please try again or download to your computer first."
    redirect_to :back
  end

  def carrierwave_integrity_error
    flash[:error] = "There was an error with that remote file for upload. It seems it's not a valid file."
    redirect_to :back
  end
  def set_section_name
       @section = I18n.t("sections.#{controller_path}")
  end
end
