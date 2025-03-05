
Capability.create(name: 'show_contracts') do |capability|
  User.create(name: 'Плотникова Арина Данииловна', login: 'arina', password: 'arina') do |user|
    user.capabilities << capability
  end
end

User.create(name: 'Беляев Никита Глебович', login: 'nikita', password: 'nikita')
User.create(name: 'Васильев Артём Никитич', login: 'artem', password: 'artem')

Contract.create(number: '11/20')
Contract.create(number: '11/21')
Contract.create(number: '11/22')

