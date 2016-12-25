# require "recurrence"
require "date"

class Practice < ApplicationRecord
  include PgSearch

  belongs_to :coach

  validates :time, :duration, :street, :city, :zipcode, presence: :true


  scope :filter_by_age_group, -> (age_group) {
    where(age_group: age_group)
  }

  pg_search_scope :filter_by_city,
    :against => :city,
    :using => { :trigram => { :threshold => 0.3 } }

  pg_search_scope :filter_by_zipcode,
    :against => :zipcode,
    :using => { :trigram => { :threshold => 0.3 } }

  scope :filter_by_state, -> (state) {
    where(state: state)
  }

  scope :filter_by_date, -> (date) {
    where(date: date)
  }


  # def dates(options={})
  #   options = {:on => day_of_week.downcase, :starts => Date.today, :until => end_date}.merge(options)
  #   Recurrence.weekly(options).events
  # end


end
