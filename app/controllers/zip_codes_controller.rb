class ZipCodesController < ApplicationController
  
  def index
    @zip_codes = []
  end

  def search
    center_zip = ZipCode.find_by(zip_code: params[:zip_code])
    
    if center_zip.present?
      @zip_codes = ZipCode.where([
        "ST_Distance(ST_GeomFromText(?, 4326), zip_codes.location, 'Statute mile') < ?",
        "POINT(#{center_zip.longitude} #{center_zip.latitude})",
        params[:radius].to_i
      ])

      render :index
    else
      redirect_to root_path
    end
  end

end