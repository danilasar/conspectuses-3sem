
= Введение
На заре развития компьютерных сетей, когда встала необходимость обеспечения обмена разнообразными данными между различными сетевыми устройствами, для задания единообразного способа передачи информации возникли различные соглашения интерфейса --- протоколы передачи данных --- а Международная организация по стандартизации (ИСО) представила модель сетевых протоколов OSI/ISO (также OSI), которая разделила различные уровни взаимодействия систем и, таким образом, стала путеводной звездой при разработке будущих протоколов, эталонной моделью взаимосвязи открытых систем. Она состоит из семи уровней, каждый из которых выполняет определённые задачи. Эти уровни, начиная с нижнего, самого нигкоуровневого, включают:
+ Физический уровень (У1)
+ Канальный уровень (У2)
+ Сетевой уровень (У3)
+ Транспортный уровень (У4)
+ Сеансовый уровень (У5)
+ Представительский уровень (У6)
+ Прикладной уровень (У7)
Каждый уровень модели OSI отвечает за свою часть процесса передачи данных, обеспечивая абстракцию и независимость от конкретных технологий.

Физический уровень является первым и самым низким уровнем модели OSI. Он отвечает за передачу необработанных битов данных по физическим носителям, таким как кабели и радиоволны. Он определяет способы передачи битов по физическим носителям, включая медные и оптоволоконные кабели, беспроводные каналы. Также У1 описывает электрические, механические и функциональные характеристики для активации и поддержания соединений между устройствами связи. Собственно, здесь определяются и сами физические носители, коих немалое количество от коаксиального кабеля до оптоволокна и любой беспроводной среды.

Следующий за ним канальный уровень обеспечивает контроль стабильности физического канала связи и непосредственно общение между узлами одного сегмента локальной сети. На втором уровне модели OSI данные делятся на кадры, содержащие полезную нагрузку --- данные --- и служебную информацию --- метаданные (это, в частности, могут быть сетевые адреса отправителя и получателя). Для обнаружения и даже по мере возможности исправления ошибок передачи, как правило, используются контрольные суммы. Также канальным уровнем определяются правила доступа к физическому носителю, что предотвращает коллизии.

Общепринятые и наиболее распространённые на текущий момент времени стандарты обоих уровней разработаны Институтом инженеров электротехники и электроники США (IEEE). В первую очередь это группа IEEE 802, которая состоит из нескольких наборов стандартов. Один из них --- IEEE 802.11. В нём описаны нормы и правила работы беспроводных компьютерных с использованием радиоволн и видимого света, а сам этот набор известен под торговой маркой Wi-Fi.

В рамках своей работы мною рассмотрен как сам стандарт, так и принцип его работы с физической точки зрения, а, кроме того, мною затронуты некоторые аспекты компьютерной безопасности, связанные с атакой и защитой беспроводных сетей на физическом уровне.
