if @error
  json.message @error
elsif @errors.blank?
  json.message "Ride is finished"
  json.travel_distance @distance
  json.travel_cost_by_distance @cost_by_distance
  json.travel_time_in_minutes @travel_time
  json.travel_cost_by_minuts @cost_by_time
  json.cost_unit UNIT
else
  json.message @errors
end
