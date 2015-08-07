require 'rubygems'
require 'bundler/setup'

require_relative( 'orders')


orderlist = File.readlines(filename)

orders = Orders.new

orders.read_order(orderlist)
