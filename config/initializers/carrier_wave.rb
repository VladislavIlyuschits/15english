# frozen_string_literal: true

require "carrierwave/orm/activerecord"

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              "AWS",
      aws_access_key_i:      ENV["S3_ACCESS_KEY"],
      aws_secret_access_key: ENV["S3_SECRET_KEY"]
    }
    config.fog_directory = ENV["S3_BUCKET"]
    config.fog_provider = "fog/aws"
  end
end
