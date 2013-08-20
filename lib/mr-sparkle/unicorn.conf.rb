worker_processes 1
timeout 600

GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true

before_fork do |server, worker|
  require 'bundler'
  Bundler.require(:default, ENV["RACK_ENV"])
end
