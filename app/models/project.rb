class Project < ApplicationRecord
  has_many :notifications

  validates_presence_of :name
end
