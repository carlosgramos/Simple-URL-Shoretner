class UrlsController < ApplicationController

  def new
  end

  def create
    @url = Url.new(url_params)
    if @url.url.include?('http://')
      strip_http_scheme(@url)
    elsif @url.url.include?('https://')
      strip_https_scheme(@url)
    end
    @url.save
    redirect_to url_show_path(@url)
  end

  def show
    @url = Url.find(params[:id])
  end

end

#############################################
private

  def url_params
    params.require(:url).permit(:url)
  end

  def strip_http_scheme(url_object)
    @url.url = url_object.url.sub(/http:\/\//, "")
    return @url
  end

  def strip_https_scheme(url_object)
    @url.url = @url.url.sub(/https:\/\//, "")
    return @url
  end
