#Область ОбработчикиСобытийЭлементовТаблицыФормыВозвратнаяТара

&НаКлиенте
Процедура ВозвратнаяТараЗабПриИзменении(Элемент)

	ОбновитьИтоги(ЭтаФорма);

КонецПроцедуры

&НаКлиенте
Процедура ВозвратнаяТараЗабПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	
	Если НоваяСтрока И ОтменаРедактирования Тогда
		ОбновитьИтоги(ЭтаФорма);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВозвратнаяТараЗабНоменклатураПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.ВозвратнаяТараЗаб.ТекущиеДанные;
	
	ДанныеСтрокиТаблицы = Новый Структура("Номенклатура, Количество, Цена, Сумма, СчетУчетаБУ,
		|СхемаРеализации, НалоговоеНазначение, НалоговоеНазначениеДоходовИЗатрат");
	ЗаполнитьЗначенияСвойств(ДанныеСтрокиТаблицы, ТекущиеДанные);
	
	ДанныеОбъекта = Новый Структура("Ссылка, Дата, ВидОперации, Организация,
		|Склад, ТипЦен, ВалютаДокумента, КурсВзаиморасчетов, КратностьВзаиморасчетов,
		|СуммаВключаетНДС, ДоговорКонтрагента,
		|ЭтоКомиссия, Реализация");
	ЗаполнитьЗначенияСвойств(ДанныеОбъекта, Объект);
	ДанныеОбъекта.СуммаВключаетНДС = Истина;
	ДанныеОбъекта.ЭтоКомиссия      = ЭтоКомиссия;
	ДанныеОбъекта.Реализация       = Истина;
	
	ВозвратнаяТараНоменклатураПриИзмененииНаСервере(ДанныеСтрокиТаблицы, ДанныеОбъекта);
	
	ЗаполнитьЗначенияСвойств(ТекущиеДанные, ДанныеСтрокиТаблицы);
	
КонецПроцедуры

&НаКлиенте
Процедура ВозвратнаяТараЗабКоличествоПриИзменении(Элемент)

	ОбработкаТабличныхЧастейКлиентСервер.ПриИзмененииКоличествоЦена(ЭтаФорма, "ВозвратнаяТараЗаб");

КонецПроцедуры

&НаКлиенте
Процедура ВозвратнаяТараЗабЦенаПриИзменении(Элемент)

	ОбработкаТабличныхЧастейКлиентСервер.ПриИзмененииКоличествоЦена(ЭтаФорма, "ВозвратнаяТараЗаб");

КонецПроцедуры

&НаКлиенте
Процедура ВозвратнаяТараЗабСуммаПриИзменении(Элемент)

	ОбработкаТабличныхЧастейКлиентСервер.ПриИзмененииСумма(ЭтаФорма, "ВозвратнаяТараЗаб");

КонецПроцедуры

#КонецОбласти	 //ОбработчикиСобытийЭлементовТаблицыФормыВозвратнаяТара

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ДобавитьИзПоступленияТараЗаб(Команда)

	РеализацияТоваровУслугФормыКлиент.ОткрытьФормуВыбораПоступленияТоваровУслуг(ЭтаФорма, "ВозвратнаяТараЗаб", "Добавить");

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьПоПоступлениюТараЗаб(Команда)

	РеализацияТоваровУслугФормыКлиент.ОткрытьФормуВыбораПоступленияТоваровУслуг(ЭтаФорма, "ВозвратнаяТараЗаб", "Заполнить");

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьПоСчетуТараЗаб(Команда)
	
	ЗаполнитьТабличнуюЧастьПоСчету("ВозвратнаяТараЗаб");
	
КонецПроцедуры

&НаКлиенте
Процедура ПодборВозвратнаяТараЗаб(Команда)

	РеализацияТоваровУслугФормыКлиент.ПодборНоменклатуры(ЭтаФорма, "ВозвратнаяТараЗаб", Команда);
	
КонецПроцедуры


#КонецОбласти    //ОбработчикиКомандФормы
