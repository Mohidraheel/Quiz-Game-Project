TITLE My First Program (Test.asm)
INCLUDE Irvine32.inc

.data
q0 byte "What is the capital of France?", 0
q1 byte "What is 2 + 2?", 0
q2 byte "Who wrote 'Romeo and Juliet'?", 0
q3 byte "What is the boiling point of water?", 0
q4 byte "What planet is known as the Red Planet?", 0
q5 byte "Who painted the Mona Lisa?", 0
q6 byte "What is the largest ocean on Earth?", 0
q7 byte "What is AeroDynamics?", 0
q8 byte "Is C++ the same as C language?", 0
q9 byte "How many types of registers are in AL?", 0
qArray dd q0, q1, q2, q3, q4, q5, q6, q7, q8, q9

string byte "Enter Your Name:", 0
nameBuffer byte 30 dup(?), 0 

options0 byte "1-Paris 2-London 3-Berlin 4-Madrid", 0
options1 byte "1-3 2-4 3-5 4-6", 0
options2 byte "1-Shakespeare 2-Hemingway 3-Dickens 4-Austen", 0
options3 byte "1-100�C 2-212�F 3-90�C 4-85�C", 0
options4 byte "1-Earth 2-Mars 3-Venus 4-Jupiter", 0
options5 byte "1-Da Vinci 2-Van Gogh 3-Picasso 4-Monet", 0
options6 byte "1-Atlantic 2-Indian 3-Arctic 4-Pacific", 0
options7 byte "1-Aerodynamics is the study of air flow. 2-Aerodynamics is the study of mechanics. 3-Aerodynamics is the study of space. 4-Aerodynamics is the study of the ocean.", 0
options8 byte "1-Yes 2-No 3-Maybe 4-Not sure", 0
options9 byte "1-2 2-3 3-4 4-5", 0

optionsArray dd options0, options1, options2, options3, options4, options5, options6, options7, options8, options9

.code
main PROC


mov edx, offset string
call WriteString
mov ecx,255

mov edx, offset nameBuffer
call ReadString


mov ecx, 10  
mov eax, 0   

l1:
push ecx
mov edx, [qArray + eax * 4]  
call WriteString
mov ebx,0
call crlf
mov edx, [optionsArray + ebx * 4]  
call writestring
call CrLf
call crlf
inc eax
inc ebx
loop l1

exit
main ENDP
END main
