require 'rake/testtask'
require "teaspoon/console" if Rails.env.test? 

namespace 'spec' do
  desc "Run the javascript test"
  task :javascripts => :environment do
    puts "\n\n===== Starting Javascript Test =====\n\n"
    fail if Teaspoon::Console.new({suite: ENV["suite"]}).execute
    puts "===== Javascript Test Complete =====\n\n\n"
  end
end

Rake::TestTask.new(:default => "spec:javascripts") do |test|
  test.pattern = 'spec/javascripts/*_test.rb'
  test.verbose = true
end
