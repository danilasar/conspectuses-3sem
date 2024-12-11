#import "conf.typ" : conf
#show: conf.with(
  title: [Лабораторная работа №6],
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


#align(left)[= Текст программы на языке ассемблера с комментариями]  

```nasm
extrn ExitProcess :proc,
      MessageBoxA :proc


.data
caption db '64-bit hello!', 0
message db 'Hello World!',  0

.code
mainCRTStartup proc
  sub RSP, 8*5

  xor RCX, RCX
  lea RDX, message
  lea R8, caption
  xor R9, R9

  call MessageBoxA

  xor RCX, RCX

  call ExitProcess
mainCRTStartup endp
public mainCRTStartup
end
```

#align(left)[= Скриншот запуска программы]  
#v(0.5cm)
#align(center)[#image("screen.png", width: 95%)]
