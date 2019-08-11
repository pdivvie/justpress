CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = Rails.application.credentials.production[:aws][:s3_bucket_name] # for AWS-side bucket access permissions config, see section below
  config.aws_acl    = 'private'

  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }

  config.aws_credentials = {
    access_key_id:     Rails.application.credentials.production[:aws][:access_key_id],
    secret_access_key: Rails.application.credentials.production[:aws][:secret_access_key],
    region:            Rails.application.credentials.production[:aws][:region], # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }
end