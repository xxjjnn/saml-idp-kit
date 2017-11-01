# encoding: utf-8
require 'rspec'
require 'ruby-saml'
require 'saml-idp-kit'
require 'pry'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
end

SamlIdpKit.configure do |c|
  c.algorithm = :sha256
  c.certificate = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURxekNDQXhTZ0F3SUJBZ0lCQVRBTkJna3Foa2lHOXcwQkFRc0ZBRENCaGpFTE1Ba0dBMVVFQmhNQ1FWVXgKRERBS0JnTlZCQWdUQTA1VFZ6RVBNQTBHQTFVRUJ4TUdVM2xrYm1WNU1Rd3dDZ1lEVlFRS0RBTlFTVlF4Q1RBSApCZ05WQkFzTUFERVlNQllHQTFVRUF3d1BiR0YzY21WdVkyVndhWFF1WTI5dE1TVXdJd1lKS29aSWh2Y05BUWtCCkRCWnNZWGR5Wlc1alpTNXdhWFJBWjIxaGFXd3VZMjl0TUI0WERURXlNRFF5T0RBeU1qSXlPRm9YRFRNeU1EUXkKTXpBeU1qSXlPRm93Z1lZeEN6QUpCZ05WQkFZVEFrRlZNUXd3Q2dZRFZRUUlFd05PVTFjeER6QU5CZ05WQkFjVApCbE41Wkc1bGVURU1NQW9HQTFVRUNnd0RVRWxVTVFrd0J3WURWUVFMREFBeEdEQVdCZ05WQkFNTUQyeGhkM0psCmJtTmxjR2wwTG1OdmJURWxNQ01HQ1NxR1NJYjNEUUVKQVF3V2JHRjNjbVZ1WTJVdWNHbDBRR2R0WVdsc0xtTnYKYlRDQm56QU5CZ2txaGtpRzl3MEJBUUVGQUFPQmpRQXdnWWtDZ1lFQXVCeXdQTmxDMUZvcEdMWWZGOTZTb3RpSwo4Tmo2L25XMDg0TzRvbVJNaWZ6eTd4OTU1UkxFeTY3M3EyYWlKTkIzTHZFNlh2a3Q5Y0d0eHROb09YdzFnMlV2CkhLcGxkUWJyNmJPRWpMTmVETlc3ajBvYitKclJ2QVVPSzlDUmdkeXc1TUM2bHdxVlFRNUMxRG5hVC8yZlNCRmoKYXNCRlRSMjRkRXBmVHk4SGZLRUNBd0VBQWFPQ0FTVXdnZ0VoTUFrR0ExVWRFd1FDTUFBd0N3WURWUjBQQkFRRApBZ1VnTUIwR0ExVWREZ1FXQkJRTkJHbW10M3l0S3BjSmFCYVlOYm55VTJ4a2F6QVRCZ05WSFNVRUREQUtCZ2dyCkJnRUZCUWNEQVRBZEJnbGdoa2dCaHZoQ0FRMEVFQllPVkdWemRDQllOVEE1SUdObGNuUXdnYk1HQTFVZEl3U0IKcXpDQnFJQVVEUVJwcHJkOHJTcVhDV2dXbURXNThsTnNaR3VoZ1l5a2dZa3dnWVl4Q3pBSkJnTlZCQVlUQWtGVgpNUXd3Q2dZRFZRUUlFd05PVTFjeER6QU5CZ05WQkFjVEJsTjVaRzVsZVRFTU1Bb0dBMVVFQ2d3RFVFbFVNUWt3CkJ3WURWUVFMREFBeEdEQVdCZ05WQkFNTUQyeGhkM0psYm1ObGNHbDBMbU52YlRFbE1DTUdDU3FHU0liM0RRRUoKQVF3V2JHRjNjbVZ1WTJVdWNHbDBRR2R0WVdsc0xtTnZiWUlCQVRBTkJna3Foa2lHOXcwQkFRc0ZBQU9CZ1FBRQpjVlVQQlg3dVptenFaSmZ5K3RVUE9UNUltTlFqOFZFMmxlcmhuRmpuR1BIbUhJcWhwemdud0hRdWpKZnMvYTMwCjlXbTVxd2NDYUMxZU81Y1dqY0cweDNPamRsbHNnWURhdGw1R0F1bXRCeDhKM05oV1JxTlVnaXRDSWtRbHhISXcKVWZnUWFDdXNoWWdEREw1WWJJUWErK2VnQ2dwSVorVDBEajVvUmV3Ly9BPT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo="
  c.fingerprint = "9E:65:2E:03:06:8D:80:F2:86:C7:6C:77:A1:D9:14:97:0A:4D:F4:4D"
  c.secret_key  = <<-EOS
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQC4HLA82ULUWikYth8X3pKi2Irw2Pr+dbTzg7iiZEyJ/PLvH3nl
EsTLrverZqIk0Hcu8Tpe+S31wa3G02g5fDWDZS8cqmV1Buvps4SMs14M1buPShv4
mtG8BQ4r0JGB3LDkwLqXCpVBDkLUOdpP/Z9IEWNqwEVNHbh0Sl9PLwd8oQIDAQAB
AoGAQmUGIUtwUEgbXe//kooPc26H3IdDLJSiJtcvtFBbUb/Ik/dT7AoysgltA4DF
pGURNfqERE+0BVZNJtCCW4ixew4uEhk1XowYXHCzjkzyYoFuT9v5SP4cu4q3t1kK
51JF237F0eCY3qC3k96CzPGG67bwOu9EeXAu4ka/plLdsAECQQDkg0uhR/vsJffx
tiWxcDRNFoZpCpzpdWfQBnHBzj9ZC0xrdVilxBgBpupCljO2Scy4MeiY4S1Mleel
CWRqh7RBAkEAzkIjUnllEkr5sjVb7pNy+e/eakuDxvZck0Z8X3USUki/Nm3E/GPP
c+CwmXR4QlpMpJr3/Prf1j59l/LAK9AwYQJBAL9eRSQYCJ3HXlGKXR6v/NziFEY7
oRTSQdIw02ueseZ8U89aQpbwFbqsclq5Ny1duJg5E7WUPj94+rl3mCSu6QECQBVh
0duY7htpXl1VHsSq0H6MmVgXn/+eRpaV9grHTjDtjbUMyCEKD9WJc4VVB6qJRezC
i/bT4ySIsehwp+9i08ECQEH03lCpHpbwiWH4sD25l/z3g2jCbIZ+RTV6yHIz7Coh
gAbBqA04wh64JhhfG69oTBwqwj3imlWF8+jDzV9RNNw=
-----END RSA PRIVATE KEY-----
EOS
end
