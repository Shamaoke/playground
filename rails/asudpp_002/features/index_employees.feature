# language: ru

Функциональность: Отображение списка сотрудников
  Для получения информации обо всех сотрудниках отдела
  Являясь пользователем системы
  Я хочу вывести их список

  @javascript
  Сценарий: Отобразить список сотрудников
    Дано сотрудник "Агеев Игорь Радионович"
    И сотрудник "Беляев Никита Глебович"
    И сотрудник "Васильев Артём Никитич"
    И сотрудник "Ермолов Дмитрий Константинович"
    Когда я открываю страницу со списком сотрудников
    Тогда должен быть отображен "Агеев Игорь Радионович"
    И должен быть отображен "Беляев Никита Глебович"
    И должен быть отображен "Васильев Артём Никитич"
    И должен быть отображен "Ермолов Дмитрий Константинович"

