class Consumer < ActiveRecord::Base
  validates_presence_of :name, :private_key
  validates_uniqueness_of :private_key
end
