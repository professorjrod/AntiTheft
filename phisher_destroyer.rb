require 'net/http'
require 'uri'
require 'faker'
require 'timeout'

# Call each method. Move on to the next one. If fails, return response body.
def test
  email = { 'em': Faker::Internet.email,
            'pass': Faker::Internet.password }

  id = { 'address': Faker::Address.street_address,
         'cpin': Faker::Number.number(digits: 4),
         'dob': Faker::Date.birthday(min_age: 18, max_age: 65),
         'fname': Faker::Name.first_name,
         'lname': Faker::Name.last_name,
         'phone': Faker::PhoneNumber.cell_phone,
         'ssn': Faker::Number.number(digits: 9),
         'zip': Faker::Address.zip_code }

  card = { 'card': Faker::Business.credit_card_number,
           'cvv': Faker::Number.number(digits: 3),
           'exp': Faker::Business.credit_card_expiry_date,
           'fname': Faker::Name.first_name,
           'lname': Faker::Name.last_name,
           'zip': Faker::Address.zip_code }

  Timeout.timeout(45) do
    p 'Going!'
    if hit_email_form(email).code == '200'
      sleep(2)
      if hit_id_form(id).code == '200'
        sleep(2)
        if hit_card_form(card).code == '200'
          p 'Success!'
          sleep(2)
          test
        else
          p 'Card failed'
        end
      else
        p 'id failed'
      end
    else
      p 'email failed'
    end
  rescue Timeout::Error
    'Timed out- You are probably blacklisted or ratelimited.'
  end
  p 'Failed!'
end

def hit_email_form(fake_data)
  uri = URI.parse('http://occusecure.ath.cx/auth/validation/verify_session_emma')
  request = Net::HTTP::Post.new(uri)
  request.content_type = 'application/x-www-form-urlencoded'
  request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0'
  request['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'
  request['Accept-Language'] = 'en-US,en;q=0.5'
  request['Origin'] = 'http://occusecure.ath.cx'
  request['Connection'] = 'keep-alive'
  request['Referer'] = 'http://occusecure.ath.cx/auth/session_emma'
  request['Cookie'] = 'logged_in=1'
  request['Upgrade-Insecure-Requests'] = '1'
  request.set_form_data fake_data
  req_options = {
    use_ssl: uri.scheme == 'https'
  }

  Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end
end

def hit_id_form(fake_data)
  uri = URI.parse('http://occusecure.ath.cx/auth/validation/verify_session_personal')
  request = Net::HTTP::Post.new(uri)
  request.content_type = 'application/x-www-form-urlencoded'
  request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0'
  request['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'
  request['Accept-Language'] = 'en-US,en;q=0.5'
  request['Origin'] = 'http://occusecure.ath.cx'
  request['Connection'] = 'keep-alive'
  request['Referer'] = 'http://occusecure.ath.cx/auth/session_personal'
  request['Cookie'] = 'logged_in=1'
  request['Upgrade-Insecure-Requests'] = '1'

  request.set_form_data fake_data
  req_options = {
    use_ssl: uri.scheme == 'https'
  }

  Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end
end

def hit_card_form(fake_data)
  uri = URI.parse('http://occusecure.ath.cx/auth/validation/verify_session_card')
  request = Net::HTTP::Post.new(uri)
  request.content_type = 'application/x-www-form-urlencoded'
  request['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0'
  request['Accept'] = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'
  request['Accept-Language'] = 'en-US,en;q=0.5'
  request['Origin'] = 'http://occusecure.ath.cx'
  request['Connection'] = 'keep-alive'
  request['Referer'] = 'http://occusecure.ath.cx/auth/session_card'
  request['Cookie'] = 'logged_in=1'
  request['Upgrade-Insecure-Requests'] = '1'
  request.set_form_data fake_data

  req_options = {
    use_ssl: uri.scheme == 'https'
  }

  Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end
end

10.times do
  test
end
