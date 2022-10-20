$regfile = "m32def.dat"
$crystal = 8000000
Config Lcdpin = Pin , Db4 = Portb.7 , Db5 = Portb.6 , Db6 = Portb.5 , Db7 = Portb.4 , E = Portd.2 , Rs = Portd.3
Config Lcd = 16 * 2
Config Kbd = Portc , Debounce = 50
Dim Win As Word
Dim Kb As Word
Dim Ep As Word                   '
Dim Ea As Word
Config Pina.0 = Input
Config Pind.0 = Input
Config Pind.1 = Input
Config Portd.4 = Output
Config Portd.5 = Output
Config Portd.6 = Output
Config Pinb.2 = Input
Config Portb.0 = Output
Config Portb.1 = Output
Config Portd.7 = Output
E Alias Portd.6
R Alias Portd.5
L Alias Portd.4
Fla Alias Portd.7
Gla Alias Pinb.2
Kup Alias Pind.1
Kdown Alias Pind.0
Ba Alias Portb.0
Al Alias Pina.0
Fa Alias Portb.1
Cls
Lcd "HAVE GOOD DAY"
Wait 5
Do
Cls
Kb = Getkbd()
If Kb < 16 Then
Ba = 1
Waitms 100
Ba = 0
End If
If Kb = 3 Then
Ea = 1
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "50%on"
Wait 1
Elseif Kb = 11 Then
Ea = 2
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "100%on"
Wait 1
Elseif Kb = 15 Then
Ea = 0
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "0%on"
Wait 1
Elseif Kb = 12 Then
Ba = 0
Elseif Kb = 13 Then
Fa = 0
End If

If Kb = 4 Then
Cls
Lcd "up"

Do
If Kup = 1 Then
E = 0
L = 0
R = 0
Exit Do
End If
Kb = Getkbd()
If Kb <> 4 Then
E = 0
L = 0
R = 0
Fla = 0
Exit Do

End If
E = 1
L = 1
R = 0
Fla = 1
Waitms 500
If Gla = 0 Then
E = 0
L = 0
R = 0
Fla = 0
Cls
Lcd "danger right"
Locate 2 , 1
Lcd "door"
Do
Ba = 1
Waitms 500
Fla = 1
Waitms 500
If Gla = 1 Then
Ba = 0
E = 1
L = 1
R = 0
Fla = 1
Exit Do
Fla = 0
End If
Loop
End If
Loop
End If
If Kb = 6 Then
Cls
Lcd "down"
Do
If Kdown = 1 Then
E = 0
L = 0
R = 0
Exit Do
End If
Kb = Getkbd()
If Kb <> 6 Then
E = 0
L = 0
R = 0
Exit Do
End If
E = 1
L = 0
R = 1
Loop
End If
If Al = 0 Then
If Ea = 0 Then
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "0%on"
Wait 1
Elseif Ea = 1 Then
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "50%on"
Wait 1
Fa = 1
Elseif Ea = 2 Then
Fa = 1
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "100%on"
Wait 1
Ba = 1
Do
If Kup = 1 Then
E = 0
L = 0
R = 0
Fla = 0
Exit Do
End If
E = 1
L = 1
R = 0
Fla = 1
If Gla = 0 Then
E = 0
L = 0
R = 0
Fla = 0
Cls
Lcd "danger right"
Locate 2 , 1
Lcd "door"
Do
Ba = 1
Waitms 200
Fla = 1
Waitms 20
If Gla = 1 Then
Ba = 0
E = 1
L = 1
R = 0
Cls
Lcd "active pollution"
Locate 2 , 5
Lcd "100%on"
Exit Do
End If
Loop
End If
Loop
End If
End If
If Al = 1 Then
Fa = 0
Ba = 0
Wait 1
Cls
End If
Loop
End
