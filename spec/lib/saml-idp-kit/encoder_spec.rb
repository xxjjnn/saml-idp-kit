require 'spec_helper'

describe "SamlIdpKit::Encoder", type: :lib do
  let(:encoder) { SamlIdpKit::Encoder.new }
  
  describe "#encode" do
    it "encodes an assertion for the given information" do
      assertion = encoder.encode('foo@example.com', {issuer: 'abc.net', acs_url: 'https://example.com/saml_login'})
      
      response = OneLogin::RubySaml::Response.new(assertion, settings: OneLogin::RubySaml::Settings.new(assertion_consumer_service_url: 'https://example.com/saml_login',
                                                                                                        idp_cert_fingerprint: SamlIdpKit.fingerprint))
      expect(response.is_valid?).to be_truthy
      expect(response.nameid).to         eq("foo@example.com")
      expect(response.issuers).to        include("https://example.com")
      expect(response.in_response_to).to eq('abc.net')
    end
  end
end
