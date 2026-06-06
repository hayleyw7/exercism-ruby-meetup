require 'date'

class Meetup
  WEEKDAYS = {
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 0
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def new
  end

  def day(weekday, date)
    if date == :teenth
      day_number = 13
      end_day = 19
    elsif date == :first
      day_number = 1
      end_day = 7
    elsif date == :second
      day_number = 8
      end_day = 14
    elsif date == :third
      day_number = 15
      end_day = 21
    elsif date == :fourth
      day_number = 22
      end_day = 28
    elsif date == :last
      day_number = Date.new(@year, @month, -1).day - 6
      end_day = Date.new(@year, @month, -1).day
    end

    while day_number <= end_day
      meetup_date = Date.new(@year, @month, day_number)

      return meetup_date if meetup_date.wday == WEEKDAYS[weekday]

      day_number += 1
    end
  end
end
