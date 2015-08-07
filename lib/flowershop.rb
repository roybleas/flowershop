require 'rubygems'
require 'bundler/setup'

require_relative( 'orders')

orders = Orders.new
orders.read_order(ARGF.readlines)