
User.create(login: 'arina', password: 'arina', name: 'Арина', patronymic: 'Данииловна', surname: 'Плотникова', position: 'начальник отдела')
User.create(login: 'artem', password: 'artem', name: 'Артём', patronymic: 'Никитич', surname: 'Васильев', position: 'инженер 1-й категории')
User.create(login: 'andrew', password: 'andrew', name: 'Андрей', patronymic: 'Максимович', surname: 'Сорокин', position: 'техник 1-й категории')
User.create(login: 'igor', password: 'igor', name: 'Игорь', patronymic: 'Радионович', surname: 'Агеев', position: 'специалист 1-й категории')
User.create(login: 'lev', password: 'lev', name: 'Лев', patronymic: 'Максимович', surname: 'Чернышев', position: 'заведующий лабораторией')
User.create(login: 'sofia', password: 'sofia', name: 'Софья', patronymic: 'Данииловна', surname: 'Одинцова', position: 'инженер 2-й категории')
User.create(login: 'sasha', password: 'sasha', name: 'Александра', patronymic: 'Лукинична', surname: 'Иванова', position: 'инженер 1-й категории')
User.create(login: 'dmitry', password: 'dmitry', name: 'Дмитрий', patronymic: 'Константинович', surname: 'Ермолов', position: 'техник 1-й категории')
User.create(login: 'nikita', password: 'nikita', name: 'Никита', patronymic: 'Глебович', surname: 'Беляев', position: 'инженер 1-й категории')
User.create(login: 'anna', password: 'anna', name: 'Анна', patronymic: 'Павловна', surname: 'Лаврентьева', position: 'специалист 1-й категории')

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

