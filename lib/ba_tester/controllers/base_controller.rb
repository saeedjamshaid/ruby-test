# ba_tester
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module BaTester
  # BaseController.
  class BaseController
    attr_accessor :config, :http_call_back

    def initialize(config, http_call_back: nil)
      @config = config
      @http_call_back = http_call_back

      @global_headers = {
        'user-agent' => 'APIMATIC 3.0'
      }
    end

    def validate_parameters(args)
      args.each do |_name, value|
        raise ArgumentError, "Required parameter #{_name} cannot be nil." if value.nil?
      end
    end

    def execute_request(request, binary: false)
      @http_call_back&.on_before_request(request)

      APIHelper.clean_hash(request.headers)
      request.headers.merge!(@global_headers)

      response = if binary
                   config.http_client.execute_as_binary(request)
                 else
                   config.http_client.execute_as_string(request)
                 end
      @http_call_back&.on_after_response(response)

      response
    end

    def validate_response(response)
      raise APIException.new 'HTTP Response Not OK', response unless
        response.status_code.between?(200, 208) # [200,208] = HTTP OK
    end
  end
end