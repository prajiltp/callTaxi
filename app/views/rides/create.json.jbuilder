unless @errors.blank?
  json.message @errors
else
  json.message 'cab scheduled successfully'
  json.extract! @ride.cab,
    :id,
    :number,
    :contact_number
end
