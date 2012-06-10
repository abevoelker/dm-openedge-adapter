require 'rubygems' # seems needed for 1.8 compatibility
require 'dm-core/spec/lib/pending_helpers'

Spec::Runner.configure do |config|
  config.include(DataMapper::Spec::PendingHelpers)
end
