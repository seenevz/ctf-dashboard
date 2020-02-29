# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password, :password_confirmation, :password_digest, :value_digest, :value]

=begin

For future reference in the evetual case we need to manually filter fields from app logs elsewere
https://stackoverflow.com/questions/6152388/manually-filter-parameters-in-rails

=end
