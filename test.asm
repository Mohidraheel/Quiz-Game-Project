INCLUDE Irvine32.inc
.data
stars1 byte "**************************************************" ,0
gameTitle byte "*<<<<<<<<<<<<<<<<<<<QUIZ GAME>>>>>>>>>>>>>>>>>>>>*" ,0
title1 byte "Test your knowledge and see how well you do!" , 0
dash byte "______________________________________________________________________________" , 0
dash1 byte "__________________________________________________" , 0
thanks byte "*<<Thank You for Playing! Press any key to exit>>*" , 0
made byte "MADE BY: " ,0
members byte "Mohid Raheel Khan (23K-3000) -- Ali Mobin (23K-0622) -- Hani Ali (23K-0007)" ,0

wrong byte "Incorrect input. Please enter correct number of level (1 or 2).", 0
tries byte "Attempts left: " , 0
invalidI byte "Invalid input. No attempts left! Cannot enter into the game." , 0

q0 byte "Q1-What is the capital of France?", 0
q1 byte "Q2-What is 2 + 2?", 0
q2 byte "Q3-Who wrote 'Romeo and Juliet'?", 0
q3 byte "Q4-What is the boiling point of water?", 0
q4 byte "Q5-What planet is known as the Red Planet?", 0
q5 byte "Q6-Who painted the Mona Lisa?", 0
q6 byte "Q7-What is the largest ocean on Earth?", 0
q7 byte "Q8-What is AeroDynamics?", 0
q8 byte "Q9-Is C++ the same as C language?", 0
q9 byte "Q10-How many types of registers are in AL?", 0
qArray dd q0, q1, q2, q3, q4, q5, q6, q7, q8, q9

string byte "Enter Your Name:", 0
nameBuffer byte 30 dup(?), 0

options0 byte "1-Paris 2-London 3-Berlin 4-Madrid", 0
options1 byte "1-3 2-4 3-5 4-6", 0
options2 byte "1-Shakespeare 2-Hemingway 3-Dickens 4-Austen", 0
options3 byte "1-100C 2-212F 3-90C 4-85C", 0
options4 byte "1-Earth 2-Mars 3-Venus 4-Jupiter", 0
options5 byte "1-Da Vinci 2-Van Gogh 3-Picasso 4-Monet", 0
options6 byte "1-Atlantic 2-Indian 3-Arctic 4-Pacific", 0
options7 byte "1-Aerodynamics is the study of air flow. 2-Aerodynamics is the study of mechanics. 3-Aerodynamics is the study of space. 4-Aerodynamics is the study of the ocean.", 0
options8 byte "1-Yes 2-No 3-Maybe 4-Not sure", 0
options9 byte "1-2 2-3 3-4 4-5", 0

optionsArray dd options0, options1, options2, options3, options4, options5, options6, options7, options8, options9
;level2
q10 byte "Q1-What is the chemical symbol for Gold?", 0
q11 byte "Q2-Who developed the theory of relativity?", 0
q12 byte "Q3-What is the largest planet in our solar system?", 0
q13 byte "Q4-Which element has the atomic number 79?", 0
q14 byte "Q5-What is the square root of 256?", 0
q15 byte "Q6-Who was the first president of the United States?", 0
q16 byte "Q7-What is the capital of Japan?", 0
q17 byte "Q8-Which of these is a prime number?", 0
q18 byte "Q9-What is the freezing point of water in Fahrenheit?", 0
q19 byte "Q10-Which country is known as the Land of the Rising Sun?", 0

options10 byte "1-Au 2-Ag 3-Pb 4-Fe", 0
options11 byte "1-Einstein 2-Galileo 3-Curie 4-Newton", 0
options12 byte "1-Jupiter 2-Saturn 3-Earth 4-Mars", 0
options13 byte "1-Gold 2-Iron 3-Copper 4-Lead", 0
options14 byte "1-12 2-14 3-16 4-18", 0
options15 byte "1-Washington 2-Lincoln 3-Roosevelt 4-Kennedy", 0
options16 byte "1-Beijing 2-Tokyo 3-Seoul 4-Bangkok", 0
options17 byte "1-4 2-8 3-41 4-27", 0
options18 byte "1-0C 2-32F 3-100C 4-50F", 0
options19 byte "1-Korea 2-Japan 3-China 4-Thailand", 0


qArray2 dd q10, q11, q12, q13, q14, q15, q16, q17, q18, q19
optionsArray2 dd options10, options11, options12, options13, options14, options15, options16, options17, options18, options19


string8 byte "Select Difficulty (1||2):",0
difficulty dword ?
string9 byte "Enter Your RollNumber:",0
rollbuffer byte 30 dup(?),0
AnsArray1 DWORD 1,2,1,1,2,1,4,1,2,3
AnsArray2 DWORD 1,1,1,1,3,2,2,3,2,2
score DWORD ?
string11 byte " your Score is ",0
string10 byte "Enter Answer: ",0
inputarray DWORD 10 dup(0) ; Corrected the size of inputarray to match the number of questions


result1 byte "Needs significant improvement; consider focusing on the basics and practicing more.",0
result2 byte "Some progress, but there is room for growth; keep practicing to strengthen your skills.",0
result3 byte "A solid performance; you are doing well, but there's potential to push even further.",0
result4 byte "Outstanding performance! Keep up the excellent work.",0

starRes byte "**************************************************************" , 0
resultmsg byte "*<<<<<<<<<<<<<<<<<<<<<<<<<<<RESULT>>>>>>>>>>>>>>>>>>>>>>>>>>>*" , 0
invalidinputmsg byte "Invalid input. Please select an option between 1 and 4" , 0
.code

Level1 proc
mov score,0
mov ecx,10
mov esi,0

L7:
call crlf
mov edx, [qArray + esi * 4]
call WriteString
call crlf

mov edx, [optionsArray + esi * 4]
call WriteString
call crlf

mov edx,OFFSET string10
call writestring
call readint

cmp eax,1
jl invalidOpt
cmp eax,4
jg invalidOpt

mov inputarray[esi*4],eax
cmp eax, [AnsArray1 + esi * 4]
jne noInc
inc score

noInc:
inc esi
call crlf
jmp L9

invalidOpt:
mov edx , offset invalidinputmsg
call writestring
call crlf
jmp noInc
L9:
loop L7

call crlf
call crlf
call crlf

push score
call scorecal
pop eax
ret

Level1 endp


Level2 Proc
mov score,0
mov ecx,10
mov esi,0

L8 :
call crlf
mov edx, [qArray2 + esi * 4]
call WriteString
call crlf

mov edx, [optionsArray2 + esi * 4]
call WriteString
call crlf

mov edx,OFFSET string10
call writestring
call readint

cmp eax,1
jl invalidOpt
cmp eax,4
jg invalidOpt

cmp eax, [AnsArray2 + esi * 4]
jne noInc2
inc score

noInc2 :
inc esi
call crlf
jmp L10

invalidOpt:
mov edx , offset invalidinputmsg
call writestring
call crlf
jmp noInc2
L10:
loop L8

call crlf
call crlf
call crlf

push score
call scorecal
pop eax
ret
level2 endp

scorecal PROC
push ebp
mov ebp,esp
mov eax,[ebp+8]
mov edx , offset dash
call writestring
call crlf
mov edx , offset starRes
call writestring
call crlf
mov edx , offset resultmsg
call writestring
call crlf
mov edx , offset starRes
call writestring
call crlf
call crlf
mov edx , offset nameBuffer
call writestring
mov edx,OFFSET string11
call writestring
call writedec
call crlf
cmp eax,2
jle l1
cmp eax,5
jle l2
cmp eax,8
jle l3
cmp eax,10
jle l4

l1:
mov edx,offset result1
call writestring
call crlf
jmp l5

l2:
mov edx,offset result2
call writestring
call crlf
jmp l5

l3:
mov edx,offset result3
call writestring
call crlf
jmp l5

l4:
mov edx,offset result4
call writestring
call crlf
jmp l5

l5:
pop ebp
ret
scorecal ENDP

main PROC

mov edx , offset stars1
call WriteString
call crlf

mov edx , offset gameTitle
call WriteString
call crlf

mov edx , offset stars1
call WriteString
call crlf


mov edx , offset title1
call WriteString
call crlf

mov edx , offset dash1
call WriteString
call crlf

mov edx, offset string
call WriteString
mov ecx, 255
mov edx, offset nameBuffer
call ReadString
mov edx, offset string9
call WriteString
mov ecx, 255
mov edx, offset rollbuffer
call ReadString

call crlf

mov ecx , 3 ;for number of tries

inputTry:
mov edx, offset string8
call WriteString
call readint
mov difficulty, eax

; validity check karni
cmp eax, 1
je valid
cmp eax, 2
je valid

;agar invalid ha tou retry
dec ecx
cmp ecx , 0 ; checking kay attempts rehti hain
je invalidInput

; warna show remaining tries
mov eax , ecx
mov edx , offset wrong
call writestring
call crlf
mov edx , offset tries
call writestring
call writedec
call crlf
jmp inputTry


valid:
cmp eax , 1
jne l2
call Level1
jmp endQuiz

l2:
call Level2
jmp endQuiz

invalidInput:
call crlf
mov edx , offset invalidI
call writestring
call crlf
mov edx, offset dash
call WriteString
call crlf
mov edx, offset made
call WriteString
call crlf
mov edx, offset members
call WriteString
call crlf
mov edx, offset dash
call WriteString
call crlf

endQuiz:
;mov edx, offset string7
;call WriteString
call crlf

mov edx, offset dash
call WriteString
call crlf

mov edx, offset stars1
call WriteString
call crlf

mov edx, offset thanks
call WriteString
call crlf

mov edx, offset stars1
call WriteString
call crlf
mov edx, offset dash
call WriteString
call crlf
mov edx, offset made
call WriteString
call crlf
mov edx, offset members
call WriteString
call crlf
mov edx, offset dash
call WriteString
call crlf

exit
main ENDP
END main