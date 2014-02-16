#!/usr/bin/ruby1.9.3
require "sinatra"
require "pg"
set :bind, '0.0.0.0'
db1 = `echo $DB1_PORT`.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/).first
db = PGconn.new(:host => db1, :dbname => "postgres", :user => "postgres")
get '/users' do
  db.exec("SELECT * FROM users").values.join("\n")
end
