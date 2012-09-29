# encoding: utf-8

require File.expand_path('../lib/dm-openedge-adapter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'dm-openedge-adapter'
  gem.summary     = 'OpenEdge Adapter for DataMapper'
  gem.description = gem.summary
  gem.email       = 'abe@abevoelker.com'
  gem.homepage    = 'http://datamapper.org'
  gem.authors     = [ 'Abe Voelker' ]

  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[ LICENSE ]

  gem.require_paths = %w[ lib ]
  gem.version       = DataMapper::OpenedgeAdapter::VERSION

  gem.add_runtime_dependency('dm-do-adapter',     [ '~> 1.2.0'  ])
  gem.add_runtime_dependency('do_openedge',       [ '~> 0.10.9' ])

  gem.add_development_dependency('dm-migrations', [ '~> 1.2.0' ])
  gem.add_development_dependency('rake',          [ '~> 0.9.2' ])
  gem.add_development_dependency('rspec',         [ '~> 1.3.2' ])
end
