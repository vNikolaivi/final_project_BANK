users_list = [
    ["Petro", "Pukas", "petro_pukas@gmail.com", "123456789", "123456789", "22/08/1985", "man", "+380952344468"],
    ["Anastasia", "Kyltchitskaya", "anastasia_kyltchitskaya@gmail.com", "123456789", "123456789", "30/11/2001", "women", "+380666781800"],
    ["Tatyna", "Tsarenko", "tatyna_tsarenko@gmail.com", "123456789", "123456789", "24/05/1991", "women", "+380682488731"],
    ["Oleg", "Bogachenko", "oleg_bogachenko@gmail.com", "123456789", "123456789", "12/12/1981", "man", "+380962807943"],
    ["Oleksandr", "Taran", "oleksandr_taran@gmail.com", "123456789", "123456789", "23/01/1986", "man", "+380663211188"],
    ["Nikolai", "Zayats", "nikolai_zayats@gmail.com", "123456789", "123456789", "15/08/1985", "man", "+380965677916"],
    ["Leonid", "Hlan", "leonid_hlan@gmail.com", "123456789", "123456789", "22/09/1952", "man", "+380663561680"],
    ["Natalia", "Borisova", "natalia_borisova@gmail.com", "123456789", "123456789", "20/10/1987", "women", "+380957923498"],
    ["Vasil", "Dydnik", "vasil_dydnik@gmail.com", "123456789", "123456789", "18/12/1985", "man", "+380971803825"]
]
users_list.each do |first_name, last_name, email, encrypted_password, reset_password_token, birthday, geneder, phone|
  User.create(first_name: first_name, last_name: last_name, email: email, encrypted_password: encrypted_password, reset_password_token: reset_password_token, birthday: birthday, geneder: geneder, phone: phone)
end