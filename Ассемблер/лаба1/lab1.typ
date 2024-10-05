#import "conf.typ" : conf
#show: conf.with(
  title: [Лабораторная работа №1],
  type: "referat",
  info: (
      author: (
        name: [Григорьева Данилы Евгеньевича],
        faculty: [КНиИТ],
        group: "251",
        sex: "male"
      ),
      inspector: (
        degree: "Старший преподаватель",
        name: "Е. М. Черноусова"
      )
  ),
  settings: (
    title_page: (
      enabled: true
    ),
    contents_page: (
      enabled: true
    )
  )
)




#align(left)[= Задание №1]

== Текст задания

Измените программы из примеров 1, 2 и 3 так, чтобы они выводили на экран ваши фамилию, имя и номер группы. Используя командные файлы (с расширением bat), подготовьте к выполнению и запустите 3 программы. Убедитесь, что они выводят на экран нужный текст и успешно завершаются.

== Тексты программ

```yasm
stak segment stack 'stack'      ;Начало сегмента стека
db 256 dup (?)                  ;Резервируем 256 байт для стека
stak ends                       ;Конец сегмента стека
data segment 'data'             ;Начало сегмента данных
Names db 'Grogoriev Danila, 251$'   ;Строка для вывода
data ends                       ;Конец сегмента данных
code segment 'code'             ;Начало сегмента кода
assume CS:code,DS:data,SS:stak  ;Сегментный регистр CS будет указывать на сегмент команд,
                                ;регистр DS - на сегмент данных, SS – на стек
start:                          ;Точка входа в программу start
;Обязательная инициализация регистра DS в начале программы
mov AX,data                     ;Адрес сегмента данных сначала загрузим в AX,
mov DS,AX                       ;а затем перенесем из AX в DS
mov AH,09h                      ;Функция DOS 9h вывода на экран
mov DX,offset Names             ;Адрес начала строки 'Hello, World!' записывается в регистр DX
int 21h                         ;Вызов функции DOS
mov AX,4C00h                    ;Функция 4Ch завершения программы с кодом возврата 0
int 21h                         ;Вызов функции DOS
code ends                       ;Конец сегмента кода
end start                       ;Конец текста программы с точкой входа


```
#text(size: 12pt, align(center)[Текст программы №1])
#pagebreak(weak: true)

```yasm
.model small                 ;Модель памяти SMALL использует сегменты 
                             ;размером не более 64Кб
.stack 100h                  ;Сегмент стека размером 100h (256 байт)
.data                        ;Начало сегмента данных
Names db 'Danila Grigoriev, 251$'
.code                        ;Начало сегмента кода
start:                       ;Точка входа в программу start 
                             ;Предопределенная метка @data обозначает
                             ;адрес сегмента данных в момент запуска программы,
mov AX, @data                ;который сначала загрузим в AX,
mov DS,AX                    ;а затем перенесем из AX в DS
mov AH,09h
mov DX,offset Names
int 21h
mov AX,4C00h
int 21h
end start
```
#text(size: 12pt, align(center)[Текст программы №2])

```yasm
.model tiny               ;Модель памяти TINY, в которой код, данные и стек
                          ;размещаются в одном и том же сегменте размером до 64Кб
.code                     ;Начало сегмента кода
org 100h                  ;Устанавливает значение программного счетчика в 100h
                          ;Начало необходимое для COM-программы,
                          ;которая загружается в память с адреса PSP:100h

start:
mov AH,09h
mov DX,offset Names
int 21h
mov AX,4C00h
int 21h
;===== Data =====
Names db 'Grigoriev Danila, 251$'
end start
```
#text(size: 12pt, align(center)[Текст программы №3])

== Скриншоты запуска программ
#align(center)[#image("example1.png")]
#text(size: 12pt, align(center)[Запуск программы №1])
#align(center)[#image("example2.png")]
#text(size: 12pt, align(center)[Запуск программы №2])
#align(center)[#image("example3.png")]
#text(size: 12pt, align(center)[Запуск программы №3])

== Тексты 2-х командных файлов (для ехе-программ и для com-программы)
#v(0.5cm) // вертикальный отступ, горизонтальный h
```bat
cls
tasm.exe %1.asm
tlink.exe /x %1.obj
%1
```
#text(size: 12pt, align(center)[Текст командного файла для exe-программ])
#v(0.5cm)
```bat
cls
tasm.exe %1.asm
tlink.exe /x /t %1.obj
%1
```
#text(size: 12pt, align(center)[Текст командного файла для com-программ])
#pagebreak(weak: true)

#align(left)[= Задание №2]
== Текст задания
Заполните таблицы трассировки для 3-х программ.

== Таблицы трассировки программ
#let tracetable(caption, filename) = {
    set text(lang: "ru")
    figure(
        caption: caption,
       {
            let trace = csv(filename);

            set text(size: 8pt)

            table(columns: 13, 
                table.header(
                    table.cell(rowspan: 2, [Шаг]), table.cell(rowspan: 2, [Машинный код]),
                    table.cell(rowspan: 2, [Команда]), table.cell(colspan: 9, [Регистры]), [Флаги],
                    [AX], [BX], [CX], [DX], [SP], [DS], [SS], [CS], [IP], [CZSOPAID]
                ),
                ..trace.map(r => { 
                    r.at(2) = raw(lang: "nasm", r.at(2));
                    r
                }).flatten()
            )
        }
    )
}
#tracetable("Трассировка программы №1", "table1.csv")
#tracetable("Трассировка программы №2", "table2.csv")
#tracetable("Трассировка программы №3", "table3.csv")
//#tracetable("Трассировка программы №3", "table3.csv")
#align(center)[#image("tdexample2.png")]
#text(size: 12pt, align(center)[Трассирова программы №2])
#align(center)[#image("tdexample3.png")]
#text(size: 12pt, align(center)[Трассировка программы №3])

#align(left)[= Ответы на контрольные вопросы]

 / Вопрос 1: Что такое сегментный (базовый) адрес?
В микропроцессоре есть регистры, которые состоят из 16 бит. Эти регистры называются сегментными и обозначаются как CS, DS, SS и ES. В них хранятся 16-битные значения, которые называются базовым адресом сегмента.

Микропроцессор объединяет 16-битный исполнительный адрес и 16-битный базовый адрес следующим образом: он расширяет содержимое сегментного регистра (базовый адрес) четырьмя нулями в младших разрядах, делая его 20-битным (полный адрес сегмента), и прибавляет смещение (исполнительный адрес). В результате получается 20-битный адрес, который является физическим или абсолютным адресом ячейки памяти.

 / Вопрос 2: Сделайте листинг для первой программы (файл с расширением lst), выпишите из него размеры сегментов. Из таблицы трассировки к этой программе выпишите базовые адреса сегментов (значение DS при этом нам нужно взять после инициализации адресом сегмента данных). В каком порядке расположились сегменты программы в памяти? Расширяя базовый адрес сегмента до физического адреса, прибавляя размер этого сегмента и округляя до кратного 16 значения, мы можем получить физический адрес следующего за ним сегмента. Сделайте это для первых 2-х сегментов. (Если данные не совпали, значит, неверно заполнена таблица трассировки.)
 Code size 0011 (PARA), data size 0014 (PARA), stak size 0100 (PARA). Выпишем регистры после инициализации регистра DS:
 - DS = 48BD
 - SS = 48AD
 - CS = 48BF
В памяти программа разделена на сегменты, которые расположены в порядке увеличения размера: SS, DS, CS. Физический адрес определяется как базовый адрес, умноженный на 16h, плюс размер сегмента.  То есть расширенный базовый адрес сегмента $S S = 4 8 A D dot 10  + 0100 (s t a k s i z e) = 4 8 A D 0 + 0100 = 4 8 B D 0 ( text("кратно") 16) = 4 8 B D = D S$. Аналогично для DS = 48BD $dot $ 10 + 0014 (data size) = 48BD0 + 0014 = 48BE4 (не кратно 16, округляем до ближайшего кратного 16 вверх) = 48BF = CS.


/ Вопрос 3: Почему перед началом выполнения первой программы содержимое регистра DS в точности на 10h меньше содержимого регистра SS? (Сравниваются данные из первой строки таблицы трассировки)

После того как программа загружена в память, DOS устанавливает значения сегментных регистров DS и ES, используя адрес префикса программного сегмента PSP. Этот префикс занимает 256 байт (100h) оперативной памяти.

PSP может использоваться в программе для определения имён файлов и параметров командной строки, объёма доступной памяти, переменных окружения системы и других целей.

Чтобы DS указывал на сегмент данных программы, а не на PSP, необходимо инициализировать регистр вручную. Пусть регистр DS должен указывать на сегмент В. Для этого нужно присвоить значение DS = B. Однако это нельзя сделать напрямую с помощью команды MOV DS,B, поскольку процессор не может напрямую передать имя сегмента в сегментный регистр. Поэтому нужно использовать промежуточный регистр AX.
```yasm
MOV АХ,В
MOV DS,AX ;DS:=B
```
Аналогичным образом загружается и регистр ES.
Регистра CS загружать нет необходимости, так как к началу выполнения программы этот регистр уже будет указывать на начало сегмента кода. Такую загрузку выполняет операционная система, прежде чем передает управление программе.
Загрузить регистр SS можно двояко. Во-первых, его можно загрузить в самой программе так же, как DS. Во-вторых, такую загрузку можно поручить операционной системе, описав в программе сегмент стека с помощью ключевого слова STACK.

/ Вопрос 4: Из таблицы трассировки к первой программе выпишите машинные коды команд mov AX,data и mov AH,09h. Сколько места в памяти в байтах они занимают? Почему у них разный размер?

mov AX, data - B8BD48

0003 - 0000 = 3 байта сдвиг - размер машинного кода.

mov AH, 09h - B409

0005 - 0000 = 2 байта сдвиг - размер машинного кода.

Размер команд разный в связи с разным типом данных, помещаемых в регистры.

/ Вопрос 5: Из таблицы трассировки ко второй программе выпишите базовые адреса сегментов (значение DS при этом нам нужно взять после инициализации). При использовании модели small сегмент кода располагается в памяти первым. Убедитесь в этом. (Если это не так, значит, вы неверно заполнили таблицу трассировки.)

- DS = 48AF
- SS = 48B1
- CS = 48AD
Сегменты в модели small расположились в следующем порядке: CS, DS, SS. Убедимся в этом: $C S = 48 A D dot 10 h + 0011 (text("code size")) = 48 A D 0 + 0011 = 48 A E 1$ (не кратно 16, округляем вверх) $= 48 A F 0$ (кратно 16, значит можем условно отбросить ноль в конце) $= 48 A F = D S$. $D S = 48 A F dot 10h + 0012 = 48 A F 0 + 0012 = 48 B 02$ (не кратно 16, округляем вверх) $= 48 B 1 = S S$, в чём и следовало убедиться.

/ Вопрос 6: Сравните содержимое регистра SP в таблицах трассировки для программах 2 и 3. Объясните, почему получены эти значения.

В программах модели TINY используется только сегмент стека, в связи с этимм он инициализируется максимальным возможным значением, поскольку он будет сдвигаться при помещении в него данных. В программе SMALL используются ещё сегменты данных и кода.

/ Вопрос 7: Какие операторы называют директивами ассемблера? Приведите примеры директив.

Директивы указывают программе ассемблеру, каким образом следует объединять инструкции для создания модуля, который и станет работающей программой.

Директива ASSUME --- операторы, которые сообщают ассемблеру информацию о соответствии между сегментными регистрами, и программными сегментами. (или другими словами сообщает ассемблеру через какие сегментные регистры будут адресоваться ячейки программы.)
Директива имеет следующий формат:
```yasm
ASSUME <пара>[[, <пара>]]
ASSUME NOTHING
```
где <пара> - это \<сегментный регистр> :\<имя сегмента>
либо \<сегментный регистр> :NOTHING
Например, директива
```asm
ASSUME ES:A, DS:B, CS:C
```
сообщает ассемблеру, что для сегментирования адресов из сегмента А выбирается регистр ES, для адресов из сегмента В – регистр DS, а для адресов из сегмента С – регистр CS.

/ Вопрос 8: Зачем в последнем предложении end указывают метку, помечающую первую команду программы?

Программа на языке ассемблера состоит из программных модулей, содержащихся в различных файлах. Каждый модуль, в свою очередь, состоит из инструкций процессора или директив ассемблера и заканчивается директивой END. Метка, стоящая после кода псевдооперации END, определяет адрес, с которого должно начаться выполнение программы и называется *точкой входа в программу*.

Каждый модуль также разбивается на отдельные части *директивами сегментации*, определяющими начало и конец сегмента. Каждый сегмент начинается директивой начала сегмента – SEGMENT и заканчивается директивой конца сегмента – ENDS . В начале директив ставится имя сегмента.

Таким образом, метка, указанная в END определяет начальный адрес, с которого процессор должен начать выполнение команды.

/ Вопрос 9: Как числа размером в слово хранятся в памяти и как они заносятся в 2-ух байтовые регистры?

В зависимости от архитектуры процессора, применяется прямой или обратный порядок байт. Почти во всех процессорах байты с меньшим адресом считаются младшими, такой порядок называется Little Endian. То есть 2 байта ложатся в 2 байта. Сначала байт с младшими битами числа, затем байт со старшими.

/ Вопрос 10: Как инициализируются в программе выводимые на экран текстовые строки?

Выводимые на экран текстовые строки инициализируются в секции .data с помощью db, строка должна оканчиваться знаком \$.

Прежде чем делать int 21h нужно в DX положить адрес начала строки
```yasm
mov dx, offset имя_метки_с_которой_начинается_строка
```

/ Вопрос 11: Что нужно сделать, чтобы обратиться к DOS для вывода строки на экран? Как DOS определит, где строка закончилась?

Вывод на экран строки текста и выход из программы осуществляются путем вызова стандартных процедур DOS, называемых *прерываниями*. Прерывания под номером 21h (33 – в десятичной системе счисления) называются *функциями DOS*, у них нет названий, а только номера. Номер прерывания и его параметры передаются в регистрах процессора, при этом номер должен находиться в регистре AH. Так, например, прерывание INT 21h, с помощью которого на экран выводится строка символов, управляется двумя параметрами: в регистре AH должно быть число 9, а в регистре DX – адрес строки символов, оканчивающейся знаком '\$'.
Адрес строки Hello загружается в регистр DX с помощью оператора OFFSET (смещение):
```yasm
OFFSEТ имя
```
Выход из программы осуществляется через функцию DOS с номером 4Ch. Эта функция предполагает, что в регистре AL находится код завершения программы, который она передаст DOS. Если программа завершилась успешно, код завершения должен быть равен 0, поэтому в примере загружаем регистры AH и AL с помощь одной команды MOV ax,4C00h , после чего вызываем прерывание 21h.

/ Вопрос 12: Программы, которые должны исполняться как .EXE и .COM, имеют существенные различия по:
- размеру
- сегментной структуре
- механизму инициализации

EXE-программы содержат несколько программных сегментов, включая сегмент кода, данных и стека. EXE-файл загружается, начиная с адреса PSP:0100h. В процессе загрузки считывается информация EXE-заголовка в начале файла, при помощи которого загрузчик выполняет настройку ссылок на сегменты в загруженном модуле, чтобы учесть тот факт, что программа была загружена в произвольно выбранный сегмент. После настройки ссылок управление передается загрузочному модулю к адресу CS:IP, извлеченному из заголовка EXE.

COM-программы содержат единственный сегмент (или, во всяком случае, не содержат явных ссылок на другие сегменты). Образ COM-файла считывается с диска и помещается в память, начиная с PSP:0100h , в связи с этим COM -программа должна содержать в начале сегмента кода директиву позволяющую осуществить такую загрузку (ORG 100h). Они быстрее загружаются, ибо не требуется перемещения сегментов, и занимают меньше места на диске, поскольку EXE-заголовок и сегмент стека отсутствуют в загрузочном модуле.
