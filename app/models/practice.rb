require "recurrence"
require "date"

class Practice < ApplicationRecord
  include IceCube
  serialize :schedule, IceCube::Schedule

  has_one :coach

  def self.make_a_practice(date, time, location)
    Practice.create(day: date, time: time, location: location)
  end

  def dates(options={})
    options = {:on => day_of_week.downcase, :starts => Date.today, :until => end_date}.merge(options)
    Recurrence.weekly(options).events
  end

end
