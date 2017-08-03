require 'ffaker'

100000.times do
  DataSource.create(
    name: FFaker::Name.name,
    uid: FFaker::Internet.email,
    external_key: SecureRandom.hex,
    description: FFaker::Lorem.words(rand(200)),
    some_field: rand(100000),
    some_other_field: rand(200000),
    transaction_value: rand(200000000)/(rand(10000)+1).to_f,
    transaction_time: Time.now - rand(10).days - rand(500).minutes - rand(200).seconds,
    some_string_field: FFaker::Name.name,
    some_other_string_field: FFaker::Name.name,
    items: Array.new(rand(100)).map { |e| FFaker::Name.name },
    item_ids: Array.new(rand(100)).map { |e| rand(100000) },
    meta: (rand(2) > 0) ? {
      email: FFaker::InternetSE.disposable_email,
      domain: FFaker::InternetSE.domain_name,
      url: FFaker::InternetSE.http_url,
      mac: FFaker::InternetSE.mac,
      slug: FFaker::InternetSE.slug,
      password: FFaker::InternetSE.password,
      username: FFaker::InternetSE.user_name
    } : {}
  )
end
