#Calculadora Assembly
#Developer Yan de Oliveira
#Disciplina: Arquitetura de Computadores
#Periodo: 3º semestre

.data
	#menu
	msg: .asciiz "\nDigite:\n1- Soma\n2- Subtração\n3- Multiplicação\n4- Divisão\n-> "
	#Inserção de valores
	nmb: .asciiz "\nInsira o valor 1: "
	nmb2: .asciiz "Insira o valor 2: "
	#Resultados
	soma: .asciiz "\nO valor da soma e: "
	subt: .asciiz "\nO valor da subtração e: "
	multi: .asciiz "\nO valor da multiplicação e: "
	divisao: .asciiz "\nO valor da divisão e: "

.text 
	li, $v0,4 #imprime mensagem
	la $a0, nmb #mensagem referente ao valor 1
	syscall
	
	li $v0, 5 #lê inteiro
	syscall
	
	move $s1, $v0 #move o valor de $v0 para $s1
	
	li, $v0,4 #imprime mensagem
	la $a0, nmb2 #mensagem referente ao valor 2
	syscall
	
	li $v0, 5 #lê inteiro
	syscall
	
	move $s2, $v0 #move o valor de $v0 para $s2
	
	li $v0, 4 #imprime mensagem
	la $a0, msg #mensagem referente ao menu de opções
	syscall
	
	li $v0, 5 #lê inteiro
	syscall
	
	move $s0, $v0 #move o valor de $v0 para $s0
	
	beq $s0, 1, imprimesoma #verifica se $s0 é igual a 1
	beq $s0, 2, imprimesub #verifica se $s0 é igual a 2
	beq $s0, 3, imprimemult #verifica se $s0 é igual a 3
	beq $s0, 4, imprimediv #verifica se $s0 é igual a 4
	
	imprimesoma:
	add $s0, $s1, $s2 #realiza a soma de $s1+$s2 e aloca em $s0
	syscall
	
	li $v0, 4 #imprime mensagem
	la $a0, soma #imprime mensagem de soma
	syscall
	
	li $v0, 1 #imprime inteiro
	la $a0, ($s0) #imprime valor da soma em $s0
	syscall
	
	li $v0, 10 #para execução
	syscall
	
	imprimesub:
	sub $s0, $s1, $s2 #realiza a subtração de $s1-$s2 e aloca em $s0
	syscall
	
	li $v0, 4 #imprime mensagem
	la $a0, subt #imprime mensagem de subtração
	syscall
	
	li $v0, 1 #imprime inteiro
	la $a0, ($s0) #imprime valor da subtração em $s0
	syscall
	
	li $v0, 10 #para execução
	syscall
	
	imprimemult:
	mul $s0, $s1, $s2 #realiza a multiplicação de $s1*$s2 e aloca em $s0
	syscall
	
	li $v0, 4 #imprime mensagem
	la $a0, multi #imprime mensagem de multiplicação
	syscall
	
	li $v0, 1 #imprime inteiro
	la $a0, ($s0) #imprime valor da multiplicação em $s0
	syscall
	
	li $v0, 10 #para execução
	syscall
	
	imprimediv:
	div $s0, $s1, $s2 #realiza a divisão de $s1/$s2 e aloca em $s0
	syscall
	
	li $v0, 4 #imprime mensagem
	la $a0, divisao #imprime mensagem de divisão
	syscall
	
	li $v0, 1 #imprime inteiro
	la $a0, ($s0) #imprime valor da divisão em $s0
	syscall
	
	li $v0, 10 #para execução
	syscall
