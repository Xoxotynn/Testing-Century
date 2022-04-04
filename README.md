# Testing-Century

## Задача:
https://www.codewars.com/kata/52fb87703c1351ebd200081f/train/swift

### Юнит-тесты находятся в "TestingCenturyTests/Unit Tests"
* Покрытые юнит-тестами методы находятся в TestingCentury/ViewController
* Названия методов: whatCentury, getCentury

### Интеграционные тесты находятся в "TestingCenturyTests/Integration Tests"
* MockPersistentContainer - mock для работы с CoreData внутри модуля с тестами. Позволяет удалять записанные данные после каждого теста и не мешать их с данными из реальной БД
* Под оберткой CoreData находится SQLite БД
