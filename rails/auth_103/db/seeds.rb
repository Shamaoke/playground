
User.create(login: 'nikolai', password: 'nikolai', name: 'Николай', patronymic: 'Валерьевич', surname: 'Грачёв')
User.create(login: 'andrew', password: 'andrew', name: 'Андрей', patronymic: 'Александрович', surname: 'Плешаков')
User.create(login: 'ivan', password: 'ivan', name: 'Иван', patronymic: 'Александрович', surname: 'Уколов')
User.create(login: 'sasha', password: 'sasha', name: 'Александр', patronymic: 'Сергеевич', surname: 'Луговой')

c1120 = Contract.create(number: '11/20', date: '2020-11-20', description: 'Договор на поставку продукции №11/20')
c1121 = Contract.create(number: '11/21', date: '2020-11-21', description: 'Договор на поставку продукции №11/21')
c1122 = Contract.create(number: '11/22', date: '2020-11-22', description: 'Договор на поставку продукции №11/22')
c1123 = Contract.create(number: '11/23', date: '2020-11-23', description: 'Договор на поставку продукции №11/23')

c1120.specifications.create(number: '11/20/01', date: '2020-11-20', description: 'Спецификация №11/20/01 к договору №11/20')
c1120.specifications.create(number: '11/20/02', date: '2020-11-20', description: 'Спецификация №11/20/02 к договору №11/20')

c1121.specifications.create(number: '11/21/01', date: '2020-11-21', description: 'Спецификация №11/21/01 к договору №11/21')
c1121.specifications.create(number: '11/21/02', date: '2020-11-21', description: 'Спецификация №11/21/02 к договору №11/21')

c1122.specifications.create(number: '11/22/01', date: '2020-11-22', description: 'Спецификация №11/22/01 к договору №11/22')
c1122.specifications.create(number: '11/22/02', date: '2020-11-22', description: 'Спецификация №11/22/02 к договору №11/22')

c1123.specifications.create(number: '11/23/01', date: '2020-11-23', description: 'Спецификация №11/23/01 к договору №11/23')
c1123.specifications.create(number: '11/23/02', date: '2020-11-23', description: 'Спецификация №11/23/02 к договору №11/23')

