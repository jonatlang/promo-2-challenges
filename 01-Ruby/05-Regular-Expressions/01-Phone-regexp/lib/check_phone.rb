FRENCH_PHONE_PATTERN = /^(0|\+33)[1-9]\d{8}$/
# See http://rubular.com/r/nIsUkUdFYR

def french_phone_number?(phone_number)
  phone_number = clean_up phone_number
  !phone_number.match(FRENCH_PHONE_PATTERN).nil?
end

# Remove everything which is not a digit or a +.
def clean_up(phone_number)
  phone_number.gsub(/[^\d\+]/, "")
end