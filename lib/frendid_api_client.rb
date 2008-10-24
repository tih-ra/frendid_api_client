# FrendidApiClient
module FrendidApiClient
  API_HOST = "frendid.com"
  API_PATH_REST  = "/api/restservers"
  class Push
    attr_accessor :options
    
    def initialize(options = {})
      @options = []#options.symbolize_keys
      super()
    end
    
    def call method, options
      options.each{|k,v| @options << "#{k}=#{v}"}
      @options << "apimethod=#{method}"
    end
    
    def post_request
      # get a server handle
      http_server = Net::HTTP.new(API_HOST, 80)
      
      # build a request
      http_request = Net::HTTP::Post.new(API_PATH_REST)
      http_request.form_data = @options
    
      # get the response XML
      return http_server.start{|http| http.request(http_request)}.body
    end
    
  end
  
    
end
