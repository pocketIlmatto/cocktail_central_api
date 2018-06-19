ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.order = 'random'
  config.infer_spec_type_from_file_location!
  config.include FactoryBot::Syntax::Methods
end

RSpec::Matchers.define_negated_matcher :not_change, :change
