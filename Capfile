require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
Rake::Task[:production].invoke