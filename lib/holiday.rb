require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    # binding.pry
    if season == :winter
      # binding.pry
      holidays.each do |holiday, supply_data|
        # binding.pry
        supply_data << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday, supply_data|
        supply_data << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  returned_arr = []
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |holiday, supply_array|
        returned_arr << supply_array
      end
    end
  end
  returned_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
    # binding.pry
    puts "#{season.to_s.capitalize}:"
    # binding.pry
    holidays.each do |holiday, supply_array|
      fixed_holiday = holiday.to_s.split("_").collect {|word| word.capitalize}.join(" ")
      puts "  #{fixed_holiday}: #{supply_array.join(", ")}"
    end
    
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  # first layer seasons, then second layer holidays while checking for BBQ
  bbq_days = []
  holiday_hash.each do |season, holidays|
    # binding.pry
    holidays.each do |holiday, supplies|
      # binding.pry
      bbq_days << holiday if supplies.include?("BBQ")
    end
  end
  bbq_days
end







