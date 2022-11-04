﻿#language: ru

@tree

Функционал: создание документа Поступления товаров

Как Менеджер по закупкам я хочу
создание документа поступление товаров 
чтобы поставить товар на учет 

	Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий
		
	Сценарий: создание документа поступления товаров
	// создание документа
	* Открытие формы создания документа	
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
		Тогда открылось окно 'Поступления товаров'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Поступление товара (создание)'
	* Заполнение шапки документа
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
		Тогда элемент формы с именем "Склад" стал равен 'Малый'		
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
		И я нажимаю кнопку выбора у поля с именем "Поставщик"
		Тогда открылось окно 'Контрагенты'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000012' | 'Мосхлеб ОАО'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление товара (создание) *'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000022' | 'Veko67NE'     |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление товара (создание) *'
	* Заполнение товарной части
		И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
		И в таблице "Товары" я завершаю редактирование строки
	* Проверка заполнения табличной части
		Тогда таблица "Товары" содержит строки:
			| 'Товар'    | 'Цена'     | 'Артикул' | 'Количество' | 'Сумма'     |
			| 'Veko67NE' | '7 000,00' | 'Ч-0003'  | '10,00'      | '70 000,00' |
		И я нажимаю на кнопку "Записать"
	* Номер
		// Запоминаем значение поля "Номер" в переменную "Номер"
		И я запоминаю значение поля "Номер" как "$Номер$"				
	* Проведение документа	
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
	* Проверка создания документа
		// Список - это наименование таблицы, в которой будем проверять наличие созданного документа "Поступление товаров"
		И таблица "Список" содержит строки:
			| 'Номер' |
			| '$Номер$'   |
		
	Сценарий: Проверка наличия в справочнике номенклатуры Торт
		И В командном интерфейсе я выбираю 'Продажи' 'Товары'
		Тогда открылось окно 'Товары'
		И таблица "Список" содержит строки:
			| 'Наименование' |
			| 'Торт'   |		
	
	 
