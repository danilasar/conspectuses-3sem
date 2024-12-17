extrn ExitProcess :proc,
      MessageBoxA :proc

.data
caption db 'Абоба', 0
message db 'Григорьев Данила, 251',  0

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
end
