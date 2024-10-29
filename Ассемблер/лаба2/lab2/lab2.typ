#import "conf.typ" : conf
#show: conf.with(
  title: [Лабораторная работа №2],
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

#align(left)[= Задание №2.1]

#include "sections/task1.typ"

#align(left)[= Задание №2.2]

#include "sections/task2.typ"

#align(left)[= Контрольные вопросы]

#include "sections/questions.typ"
