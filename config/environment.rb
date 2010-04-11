RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem "jrails"
  config.gem "haml"
  config.gem "will_paginate"
  config.gem "mocha"
  config.gem "formtastic"
end