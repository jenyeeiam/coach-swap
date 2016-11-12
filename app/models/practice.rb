require "recurrence"
class Practice < ApplicationRecord
  include IceCube
  serialize :schedule, IceCube::Schedule

  has_one :coach
  has_and_belongs_to_many :days

  def self.make_a_practice(date, time, location)
    Practice.create(day: date, time: time, location: location)
  end

end
