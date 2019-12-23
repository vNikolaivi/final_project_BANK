cities_list = [

]
cities_list.each do |country_id, name, short_name, post_code|
  City.create(country_id: country_id, name: name, short_name: short_name, post_code: post_code)
end