require 'csv'
require 'simple_form'
require 'haml-rails'
require 'kaminari'
require 'jquery-rails'
require 'roo'

module Honcho

  mattr_accessor :configuration

  class Engine < ::Rails::Engine
    isolate_namespace Honcho
  end

  def self.admin_models(val)
    self.configuration[:admin_models] = val
  end

  def self.default_theme(val)
    self.configuration[:default_theme] = val
  end

  def self.title(val)
    self.configuration[:title] = val
  end

  def self.browser_title(val)
    self.configuration[:browser_title] = val
  end

  def self.auto_managed(val)
    self.configuration[:auto_managed] = val
  end

  def self.import_form_for(val)
    self.configuration[:import_form_for] = val
  end

  def self.html5_validations(val)
    self.configuration[:html5_validations] = val
  end

  def self.supported_formats(val)
    self.configuration[:supported_formats] = val
  end

  def self.config
    self.configuration ||= {}
    if block_given?
      yield(self)
      create_controllers
      include_modules
    else
      raise 'No configuration block found.'
    end
  end

  private

  def self.create_controllers
    configuration[:admin_models].each do |klass|
      controller_name = (klass.to_s.pluralize.capitalize + "Controller")
      Honcho.const_set("#{controller_name}", Class.new(Honcho::AdminController))
    end
  end

  def self.include_modules
    ActiveRecord::Base.send(:include, Honcho::Admin)
  end

end






=begin

Honcho.configure do |config|

  config.resources [:posts, :comments]
end

=end
