class Thing < ActiveRecord::Base
  has_many :print_logs
  has_many :pickup_logs
end
