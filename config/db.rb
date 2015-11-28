require 'data_mapper'
require_relative '../db/fixtures'
require_relative '../models/models'

DataMapper.setup(:default, "postgres://postgres@localhost/delphi")

DataMapper.finalize
