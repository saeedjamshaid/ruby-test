# ba_tester
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module BaTester
  # APIController
  class APIController < BaseController
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # TODO: type endpoint description here
    # @return [String] response from the API call
    def get_basic_auth_test
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/auth/basic'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url
      )
      BasicAuth.apply(config, _request)
      _response = execute_request(_request)
      validate_response(_response)

      # Return appropriate response type.
      _response.raw_body
    end
  end
end
