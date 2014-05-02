JOKES = {
  "live.com" => "%s, aren't you born before 1973?",
  "gmail.com" => "%s, you're an average but modern person",
  "lewagon.org" => "Well done %s, you're skilled and capable"
}

EMAIL_PATTERN = /([^\.@]+)(\.([^@]+))?@([^@]+)/

def mail_joke(email)
  groups = EMAIL_PATTERN.match(email)
  if groups.nil?
    raise ArgumentError.new("'#{email}' is not a valid email address")
  else
    firstname = groups[1]
    lastname = groups[3]
    email_domain = groups[4]

    full_name = lastname.nil? ? firstname : [firstname, lastname].join(" ")
    joke = JOKES[email_domain]

    if joke.nil?
      "Sorry #{full_name}, we don't know how to judge '#{email_domain}'"
    else
      joke % full_name
    end
  end
end
