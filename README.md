# Testing-Century

## Задача:
https://www.codewars.com/kata/52fb87703c1351ebd200081f/train/swift

### Юнит-тесты находятся в "TestingCenturyTests/Unit Tests"
* Покрытые юнит-тестами методы находятся в TestingCentury/ViewController
* Названия методов: whatCentury, getCentury

### Интеграционные тесты находятся в "TestingCenturyTests/Integration Tests"
* MockPersistentContainer - mock для работы с CoreData внутри модуля с тестами. Позволяет удалять записанные данные после каждого теста и не мешать их с данными из реальной БД
* Под оберткой CoreData находится SQLite БД

### e2e тесты находятся в TestingCenturyUITests
* Тестируется кнопка "What Century?" на главном экране
    * Появляется ли текст с правильно расчитанным веком на экране
    * Сохраняется ли запись в память и отображается ли на экране History
* Тестируется нахождение записи в истории по введенному значению года 
    * Находится ли только одна запись
    * Верная ли это запись
