cities_list = [
    [231, 'Cherkasy', 'CK', 18000],
    [231, 'Chernihiv', 'CH', 14000],
    [231, 'Chernivtsi', 'CV', 58000],
    [231, 'Crimea', 'KR', 95000],
    [231, 'Dnipropetrovsk', 'DP', 49000],
    [231, 'Donetsk', 'DT', 83000],
    [231, 'Ivano-Frankivsk', 'IF', 76000],
    [231, 'Kharkiv', 'KK', 61000],
    [231, 'Kherson', 'KS', 73000],
    [231, 'Khmelnytskyy', 'KM', 29000],
    [231, 'Kiev', 'KV', 07000],
    [231, 'Kiev City', 'KC', 01000],
    [231, 'Kirovohrad', 'KH', 26000],
    [231, 'Luhansk', 'LH', 91000],
    [231, 'Lviv', 'LV', 79000],
    [231, 'Mykolayiv', 'MY', 54000],
    [231, 'Odessa', 'OD', 65000],
    [231, 'Poltava', 'PL', 36000],
    [231, 'Rivne', 'RV', 33000],
    [231, 'Sevastopol City', 'SC', 99000],
    [231, 'Sumy', 'SM', 40000],
    [231, 'Ternopil', 'TP', 46000],
    [231, 'Transcarpathia', 'ZK', 88000],
    [231, 'Vinnytsya', 'VI', 21000],
    [231, 'Volyn', 'VO', 44000],
    [231, 'Zaporizhzhya', 'ZP', 69000],
    [231, 'Zhytomyr', 'ZT', 10000]
]

cities_list.each do |country_id, name, short_name, post_code|
  City.create(country_id: country_id, name: name, short_name: short_name, post_code: post_code)
end