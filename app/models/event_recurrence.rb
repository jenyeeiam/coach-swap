require "recurrence"
require "date"

class EventRecurrence < ApplicationRecord
  belongs_to :coach

  # def dates(options={})
  #   options = {:every => every, :starts => start_date, :until => end_date}.merge(options)
  #   options[:on] = case options[:every]
  #   when 'year'
  #     [options[:starts].month, options[:starts].day]
  #   when 'week'
  #     options[:starts].strftime('%A').downcase.to_sym
  #   when 'day', 'month'
  #     options[:starts].day
  #   end
  #   Recurrence.new(options).events
  # end

  def dates(options={})
    options = {:on => day_of_week.downcase, :starts => Date.today, :until => end_date}.merge(options)
    # options[:starts].strftime('%A').downcase.to_sym
    Recurrence.weekly(options).events
  end

end
