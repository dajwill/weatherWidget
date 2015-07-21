module TestHelper
  def api_check response
    if response["response"]["error"]
      redirect_to "http://www.rubyonrails.org"
    end
  end
end
