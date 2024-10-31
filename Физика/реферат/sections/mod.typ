#include "intro.typ"
#include "waves/mod.typ"
#include "signals/mod.typ"
#include "standarts.typ"
/* = Физический уровень
=== Расширение спектра
=== Мультиплексирование
=== Антенны MIMMO
В двухполяризационных антеннах используется технологи MIMO и расшифровывается Multiple Input Multiple Output (несколько входов и выходов).  Принцип работы антенн  MIMO следующий:

на передающей  стороне присутствует делитель потоков, который  разбивает данные на подпотоки. Число под потоков равняется числу антенн. Далее идет передача данных по каждой из антенн с различной поляризацией. Это делается для того чтобы  сигнал мог быть идентифицирован принимающей стороной
на принимающей стороне  антенны принимают сигнал. Каждый из передающегося подпотока поступает на антенну в приемнике. Далее из всего потока энергии  сигнала каждая антенна принимает только тот подпоток, за который она отвечает.  Распределение происходит по закону, которым снабжен каждый сигнал.
Вторая технология, которая используется в беспроводных сетях называется AirMax. Различие между Wi-Fi  и WiMax в том, что в первом случае станция прослушивает радиосигналы и определяет занятость канала (при свободном канале пакет отсылается), а во втором каждому абоненту выделяется слот для  передачи и приема данных. Как следствие, задержек нет, слушать эфир не надо. Количество пользователей в Wi-Fi технологии не более 20, а в WiMax до 120. AirMax решает проблему, когда два клиента посылают сигнал в одно время. Так же задержка передачи голоса и видео уменьшается, так как после опроса  абонентов накладывается приорите
= Канальный уровень
=== Методы определения и коррекции ошибок
Коды обнаружения ошибок, коды с коррекцией ошибок, протоколы с автоматическим запросом повторной передачи

= Атаки на беспроводные сети
== Атаки отказа в обслуживании (DoS и DDoS)
Создание широкополосных помех с помощью радио-джаммеров. Это эквивалент DoS-атаки, но только на физическом уровне радиосреды. Противостоять подобного рода атаке средствами инфраструктуры Wi-Fi практически невозможно, если мощность излучения высока
== Разведка и перехваты пакетов
=== Перехват пакетов
Самый универсальный способ атаки на точку доступа — вычисление ее ключа WPA2 по отдельным сообщениям (M1-M4) из перехваченных хендшейков. Он срабатывает практически всегда, но требует больших затрат (особенно времени). Перехват «рукопожатий» всегда выполняется в режиме мониторинга, который поддерживает далеко не каждый Wi-Fi-чип и драйвер. Для ускорения сбора хендшейков потребуется функция инжекта пакетов, которая деавторизует подключенных к AP клиентов и заставляет их чаще отправлять «рукопожатия». Она и вовсе встречается у единичных Wi-Fi-модулей.

== Атака получения доступа

== Принудительная смена алгоритма шифрования

== Атаки человека посередине
== Атаки подмены ARP записей

= Способы защиты от атак на Wi-Fi сети
== Идентификация устройства, атакующего на отказ в обслуживании
спользовать специальные технологии для идентификации типа устройства, создающего помехи и определения его физического местоположения в зоне покрытия. Например, это может быть выполнено с большой эффективностью в случае, если сеть построена на оборудовании Cisco Systems и Точки Доступа WiFi поддерживают технологию CleanAir (модельные ряды Cisco 3700, 3600, 2700, 1550 и тд). После обнаружения местоположения излучателя, в данную точку могут быть направлены сотрудники службы безопасности для физического устранения проблемы.
== Секретность на уровне проводной сети (WEP)
=== WEPCrack */
#include "outro.typ"
