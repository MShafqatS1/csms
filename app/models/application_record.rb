class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  attr_accessor :current_user
end
