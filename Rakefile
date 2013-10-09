require './resource_library_app'
require 'sinatra/activerecord/rake'
require "rspec/core/rake_task"

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.pattern = 'spec/*_spec.rb'
end

task :default => :spec
