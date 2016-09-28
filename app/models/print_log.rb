class PrintLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :thing
end
