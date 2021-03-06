$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'honcho/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'honcho'
  s.version     = Honcho::VERSION
  s.authors     = ['Sachin87']
  s.email       = ['sachin.y87@gmail.com']
  s.homepage    = 'https://github.com/sachin87/honcho'
  s.summary     = 'Simple Admin interface for web applications'
  s.description = 'Simplest, Highly Customizable Administration Framework for Ruby on Rails with Zurb Foundation.'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 5.0.0'
  s.add_dependency 'haml-rails'
  s.add_dependency 'simple_form'
  s.add_dependency 'devise'
  s.add_dependency  'roo'
  s.add_dependency  'kaminari'
  s.add_dependency  'ransack'
  s.add_dependency  'jquery-rails'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'byebug'
end
