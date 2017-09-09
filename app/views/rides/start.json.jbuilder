if @error
  json.message @error
elsif @errors.blank?
  json.message "journey started successfuly"
else
  json.message @errors
end
