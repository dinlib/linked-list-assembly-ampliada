.section .data

titgeral:	.asciz "\n*** LINKED-LIST ***\n\n"
titlista:	.asciz "\nLISTANDO:\n"
titinserenome:	.asciz "\nINSERINDO POR ORDEM DE NOME:\n"
titinseredata:	.asciz "\nINSERINDO POR ORDEM DE DATA:\n"
titremove:	.asciz "\nREMOVENDO:\n"
titatualiza:	.asciz "\nATUALIZANDO:\n"
titmostra:	.asciz "\nELEMENTOS DA LISTA:\n"
titreg:	.asciz "\nRegistro no %d:"
titordenadata: .asciz "\nORDENANDO POR DATA:\n"
titordenanome: .asciz "\nORDENANDO POR NOME:\n"
titalteracaosalariao: .asciz "\nALTERACAO SALARIAL"
menusalarial: .asciz "\nESCOLHA A OPCAO:\n 1 - AUMENTO SALARIAL\n 2 - BAIXA SALARIAL\n> "
menuaumentosalarial: .asciz "\nESCOLHA A OPCAO:\n 1 - AUMENTO POR PORCENTAGEM\n 2 - AUMENTO POR SOMA DE VALOR FIXO\n 3 - AUMENTO POR MULTIPLICAÇÃO DE FATOR\n> "
menubaixasalarial: .asciz "\nESCOLHA A OPCAO:\n 1 - BAIXA POR PORCENTAGEM\n 2 - BAIXA POR SOMA DE VALOR FIXO\n 3 - BAIXA POR DIVISÃO DE FATOR\n> "
menu:	.asciz "\nESCOLHA A OPCAO:\n 1 - INSERIR\n 2 - REMOVER\n 3 - CONSULTAR\n 4 - ATUALIZAR\n 5 - LISTAR\n 6 - ALTERAR ORDENACAO\n 7 - ALTERACAO SALARIAL\n 8 - SAIR\n> "
pedeporcentagemsalarial: .asciz "Digite a porcentagem: "
pedevalorsalarial: .asciz "Digite o valor: "
pedefatorsalarial: .asciz "Digite o fator: "
msgerro:	.asciz "\nOPCAO INCORRETA!\n"
msgvazia:	.asciz "\nLISTA VAZIA!\n"
msgremov:	.asciz "\nREGISTRO REMOVIDO DA LISTA!\n"
msginser:	.asciz "\nREGISTRO INSERIDO NA LISTA!\n"
msgatualiza:	.asciz "\nFORNECA OS NOVOS DADOS DO REGISTRO A SER ATUALIZADO:\n"
msgatualizafim:	.asciz "\nREGISTRO ATUALIZADO!\n"
msginexistente: .asciz "\nREGISTRO INEXISTENTE!\n"
msgteste: .asciz "\nTESTANDO\n"
msgtamanholista: .asciz "\nTAMANHO LISTA: %d\n"

nomeconsulta:	.space 44

pedenome:	.asciz "\nDigite o nome: "
pededata:	.asciz "\nData de Nascimento"
pededia:	.asciz "\n	Digite o dia: "
pedemes:	.asciz "\n	Digite o mes: "
pedeano:	.asciz "\n	Digite o ano: "
pedesexo:	.asciz "Qual o sexo, <F>eminino ou <M>asculino?: "
pedeprofissao:	.asciz "\nDigite a profissao: "
pedesalario:	.asciz "\nDigite o salario: "

pedenomeconsulta:	.asciz "\nDigite o nome do registro: "

mostranome:	.asciz "\nNome: %s"
mostradata:	.asciz "\nData de Nascimento: %d/%d/%d"
mostrasexo:	.asciz "\nSexo: %c"
mostraprofissao: .asciz "\nProfissao: %s"
mostrasalario: .asciz "\nSalario: %lf"
mostrapt: .asciz "\nptreg = %d\n"

formastr:	.asciz    "%s"
formach:	.asciz    "%c"
formaint:	.asciz    "%d"
formafloat:	.asciz "%lf"
pulalinha:	.asciz    "\n"
NULL:	.int 0
opcao:	.int 0
flagdata: .int 1
flagnome: .int 0

um: .int 1
cem: .int 100

nome:	.space 44
dia:	.space 8 #44(%reg)
mes:	.space 8 #52(%reg)
ano:	.space 8 #60(%reg)
sexo:	.space 4
profissao:  .space 24
salario: .space 8

pct: .space 8
val: .space 8
fat: .space 8

prox:	.int NULL
naloc:	.int 108
ptinicio:	.int NULL
ptatual:	.int NULL
ptanterior:	.int NULL
ptfim:	.int NULL
ptreg:	.int NULL

tamanholista: .int 0

flag: .int 0

.section .text

.globl       _start

_start:
	jmp main

# ---------- LER DADOS ---------- #

le_dados:
	pushl %edi

	pushl $pedenome
	call printf
	addl $4, %esp
	call gets

	popl %edi
	addl $44, %edi
	pushl %edi

	pushl $pededata
	call printf
	addl $4, %esp

	pushl $pededia
	call printf
	addl $4, %esp
	pushl $formaint
	call scanf
	addl $4, %esp

	popl %edi
	addl $8, %edi
	pushl %edi

	pushl $formach
	call scanf
	addl $4, %esp

	pushl $pedemes
	call printf
	addl $4, %esp
	pushl $formaint
	call scanf
	addl $4, %esp

	popl %edi
	addl $8, %edi
	pushl %edi

	pushl $formach
	call scanf
	addl $4, %esp

	pushl $pedeano
	call printf
	addl $4, %esp
	pushl $formaint
	call scanf
	addl $4, %esp

	popl %edi
	addl $8, %edi
	pushl %edi

	pushl $formach
	call scanf
	addl $4, %esp

	pushl $pedesexo
	call printf
	addl $4, %esp
	pushl $formach
	call scanf
	addl $4, %esp

	popl %edi
	addl $4, %edi
	pushl %edi

	pushl $formach
	call scanf
	addl $4, %esp

	pushl $pedeprofissao
	call printf
	addl $4, %esp
	call gets

	popl %edi
	addl $24, %edi
	pushl %edi

	pushl $pedesalario
	call printf
	addl $4, %esp
	pushl $formafloat
	call scanf

	addl $4, %esp

	popl %edi
	addl $8, %edi
	movl $NULL, (%edi)

	subl $104, %edi

	RET

# ---------- MOSTRAR DADOS ---------- #

mostra_dados:
	finit
	pushl %edi

	pushl $mostranome
	call printf
	addl $4, %esp
	popl %edi
	addl $44, %edi
	pushl %edi

	addl $16, %edi
	pushl (%edi)
	subl $8, %edi
	pushl (%edi)
	subl $8, %edi
	pushl (%edi)

	pushl $mostradata
	call  printf
	add $16, %esp
	popl %edi
	addl $24, %edi
	pushl %edi

	pushl (%edi)
	pushl $mostrasexo
	call  printf
	addl  $8, %esp

	popl  %edi
	addl  $4, %edi
	pushl %edi

	pushl $mostraprofissao
	call  printf
	addl  $4, %esp
	popl  %edi
	addl  $24, %edi
	pushl %edi


	fldl (%edi)
	subl $8, %esp
	fstl (%esp)
	pushl $mostrasalario
	call  printf
	addl  $12, %esp
	popl  %edi
	subl  $96,%edi
	RET

# ---------- INSERIR NA LISTA POR ORDEM DE NOME---------- #

procuraposicao:
	movl %eax, ptanterior #pt anterior setado como registro atual
	movl 104(%eax), %ebx # vai pro proximo registro
	movl %ebx, ptatual

	pushl ptinicio
	pushl %edi
	call strcasecmp
	addl $8, %esp
	cmpl $0, %eax
	jle insereinicio


	pushl ptfim
	pushl %edi
	call strcasecmp
	addl $8, %esp
	cmpl $0, %eax
	jge inserefim

continuaprocura:
	movl ptatual, %eax
	cmpl %eax, ptfim
	je insereposicao

	movl %eax, ptatual
	pushl ptatual
	pushl %edi
	call strcasecmp
	addl $8, %esp
	cmpl $0, %eax
	jle insereposicao

	movl ptatual, %eax
	movl %eax, ptanterior #pt anterior setado como registro atual
	movl 104(%eax), %ebx # vai pro proximo registro
	movl %ebx, ptatual
	jmp continuaprocura

insereposicao:
	movl ptatual, %eax
	movl ptanterior, %esi
	movl %edi, 104(%esi)
	movl %eax, 104(%edi)
	jmp continuainsere

insereinicio:

	movl ptinicio, %esi
	movl %esi, 104(%edi)
	movl %edi, ptinicio
	jmp continuainsere

inserefim:
	movl ptfim, %eax
	movl %edi, 104(%eax)
	movl %edi, ptfim
	jmp continuainsere

insere:
	pushl $titinserenome
	call  printf
	addl $4, %esp

insereatualiza:
	movl  naloc, %ecx
	pushl %ecx
	call  malloc
	movl  %eax, ptreg
	addl  $4, %esp
	movl  ptreg, %edi
	call  le_dados

	#movl NULL, %esi #pt anterior
	movl ptinicio, %eax #pt proximo

	cmpl $NULL, %eax
  	jne procuraposicao # procura a posicao do elemento na lista
	movl  %eax, 104(%edi)
	movl  %edi, ptinicio
	movl %edi, ptfim

continuainsere:
	movl tamanholista, %ebx
	incl %ebx
	movl %ebx, tamanholista
	pushl $msginser
	call  printf
	addl  $4, %esp
	RET


# ---------- INSERIR NA LISTA POR ORDEM DE DATA---------- #

procuraposicaodata:
	movl %eax, ptanterior #pt anterior setado como registro atual
	movl 104(%eax), %ebx # vai pro proximo registro
	movl %ebx, ptatual

	movl ptinicio, %ecx
	movl 60(%ecx), %ecx
	cmpl %ecx, 60(%edi)
	jl insereiniciodata

	movl ptinicio, %ecx
	movl 52(%ecx), %ecx
	cmpl %ecx, 52(%edi)
	jl insereiniciodata

	movl ptinicio, %ecx
	movl 44(%ecx), %ecx
	cmpl %ecx, 44(%edi)
	jl insereiniciodata

	movl ptfim, %ecx
	movl 60(%ecx), %ecx
	cmpl %ecx, 60(%edi)
	jl inserefimdata

	movl ptfim, %ecx
	movl 52(%ecx), %ecx
	cmpl %ecx, 52(%edi)
	jg inserefimdata

	movl ptfim, %ecx
	movl 44(%ecx), %ecx
	cmpl %ecx, 44(%edi)
	jg inserefimdata

continuaprocuradata:
	movl ptatual, %eax
	cmpl %eax, ptfim
	je insereposicaodata

	movl ptatual, %eax
	movl 60(%eax), %eax
	cmpl 60(%edi), %eax
	jge insereposicaodata

	movl ptatual, %eax
	movl 52(%eax), %eax
	cmpl 52(%edi), %eax
	jge insereposicaodata

	movl ptatual, %eax
	movl 44(%eax), %eax
	cmpl 44(%edi), %eax
	jge insereposicaodata

	movl ptatual, %eax
	movl %eax, ptanterior #pt anterior setado como registro atual
	movl 104(%eax), %ebx # vai pro proximo registro
	movl %ebx, ptatual
	jmp continuaprocuradata

insereposicaodata:
	movl ptatual, %eax
	movl ptanterior, %esi
	movl %edi, 104(%esi)
	movl %eax, 104(%edi)
	jmp continuainseredata

insereiniciodata:

	movl ptinicio, %esi
	movl %esi, 104(%edi)
	movl %edi, ptinicio
	jmp continuainseredata

inserefimdata:
	movl ptfim, %eax
	movl %edi, 104(%eax)
	movl %edi, ptfim
	jmp continuainseredata

inseredata:
	pushl $titinseredata
	call  printf
	addl $4, %esp

insereatualizadata:
	movl  naloc, %ecx
	pushl %ecx
	call  malloc
	movl  %eax, ptreg
	addl  $4, %esp
	movl  ptreg, %edi
	call  le_dados

	#movl NULL, %esi #pt anterior
	movl ptinicio, %eax #pt proximo

	cmpl $NULL, %eax
  	jne procuraposicaodata # procura a posicao do elemento na lista
	movl  %eax, 104(%edi)
	movl  %edi, ptinicio
	movl %edi, ptfim

continuainseredata:
	movl tamanholista, %ebx
	incl %ebx
	movl %ebx, tamanholista
	pushl $msginser
	call  printf
	addl  $4, %esp
	RET

# ---------- REMOVER ---------- #
remove:
	pushl $titremove
	call printf
	addl $4, %esp
	movl $0, %eax

removeatualiza:
	movl %eax, flag
	call consulta
	movl $0, %eax
	cmpl %eax, flag
	je retornoremove
	cmpl %edi, ptinicio
	je removeinicio
	cmpl %edi, ptfim
	je removefim
	jmp removemeio

removeinicio:
	movl 104(%edi), %eax
	movl %eax, ptinicio
	pushl %edi
	call free
	pushl $msgremov
	call printf
	addl $8, %esp
	movl tamanholista, %ebx
	decl %ebx
	movl %ebx, tamanholista
	jmp retornoremove

removefim:
	movl ptanterior, %eax
	movl %eax, ptfim
	pushl %edi
	call free
	pushl $msgremov
	call printf
	addl $8, %esp
	movl tamanholista, %ebx
	decl %ebx
	movl %ebx, tamanholista
	jmp retornoremove

removemeio:
	movl ptanterior, %esi
	movl 104(%edi), %eax
	movl %eax, 104(%esi)
	pushl %edi
	call free
	pushl $msgremov
	call printf
	addl $8, %esp
	movl tamanholista, %ebx
	decl %ebx
	movl %ebx, tamanholista
retornoremove:
	RET

# ---------- CONSULTAR NA LISTA ---------- #

consulta:
	movl ptinicio, %edi
	cmpl $NULL, %edi
	je consultavazia
	pushl $pedenomeconsulta
	call printf
	pushl $nomeconsulta
	call gets
	addl $8, %esp

andaconsulta:
	pushl %edi
	pushl $nomeconsulta
	call strcasecmp
	addl $8, %esp
	cmpl $0, %eax
	je sucessoconsulta
	cmpl %edi, ptfim
	je fimconsulta
	movl %edi, ptanterior
	movl 104(%edi), %edi
	jmp andaconsulta

consultavazia:
	pushl $msgvazia
	call printf
	addl $4, %esp
	jmp retornoconsulta

sucessoconsulta:
	movl $1, %eax
	movl %eax, flag #flag para ser usado no atualiza e no remove
	call mostra_dados
	pushl $pulalinha
	call printf
	addl $4, %esp
	jmp retornoconsulta

fimconsulta:
	pushl $msginexistente
	call printf
	addl $4, %esp

retornoconsulta:
	RET

# ---------- ATUALIZAR---------- #
atualiza:
	pushl $titatualiza
	call printf
	addl $4, %esp
	movl $0, %eax
	movl %eax, flag
	call removeatualiza
	movl $0, %eax
	cmpl %eax, flag
	je retornoatualiza
	pushl $msgatualiza
	call printf
	addl $4, %esp
	call insereatualiza
	pushl $msgatualizafim
	call printf
	addl $4, %esp

retornoatualiza:
	RET

# ---------- LISTAR ---------- #

lista:
	pushl $titlista
	call printf
	addl $4, %esp
	movl ptinicio, %edi
	cmpl $NULL, %edi
	je listavazia
	jne andalista

listavazia:
	pushl $msgvazia
	call printf
	addl $4, %esp
	jmp retornolista

andalista:
	call mostra_dados
	pushl $pulalinha
	call printf
	addl $4, %esp
	cmpl %edi, ptfim
	je retornolista
	movl 104(%edi), %edi
	jmp andalista

retornolista:
	RET

# ---------- ORDENA  POR DATA---------- #
ordata:
	movl ptinicio, %edi #ponteiro anterior
	cmpl $NULL, %edi
	je ordenavaziadata
	pushl $titordenadata
	call printf
	addl $4, %esp

	movl $1, %ebx
	movl %ebx, flagnome
	incl %ebx
	movl %ebx, flagdata

	movl tamanholista, %ecx
	movl 104(%edi), %eax # %eax tem ponteiro atual
loopsuperiordata:
	movl ptinicio, %edi #ponteiro anterior
	movl 104(%edi), %eax # %eax tem ponteiro atual
	movl $1, %ebx
	cmpl %ebx, %ecx
	je retordenadata
	#comeca primeiro elemento
#loopinferiornome:
loopinferiordata:
	#compara ano
	movl %eax, ptatual
	movl %edi, ptanterior
	movl 60(%eax), %eax
	movl 60(%edi), %edi
	cmpl %eax, %edi
	jg trocadata
	jl incrementodata
	#compara mês
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 52(%eax), %eax
	movl 52(%edi), %edi
	cmpl %eax, %edi
	jg trocadata
	jl incrementodata
	#compara dia
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 44(%eax), %eax
	movl 44(%edi), %edi
	cmpl %eax, %edi
	jg trocadata
incrementodata:
	incl %ebx
	cmpl %ebx, %ecx
	je decrementasuperiordata
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 104(%eax), %eax
	movl 104(%edi), %edi
	jmp loopinferiordata
trocadata:
	movl ptatual, %eax
	movl ptanterior, %edi
	#troca nome
	movl (%eax), %eax
	movl (%edi), %edi
	movl ptatual, %edx
	movl %edi, (%edx)
	movl ptanterior, %edx
	movl %eax, (%edx)
	#troca dia
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 44(%eax), %eax
	movl 44(%edi), %edi
	movl ptatual, %edx
	movl %edi, 44(%edx)
	movl ptanterior, %edx
	movl %eax, 44(%edx)
	#troca mês
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 52(%eax), %eax
	movl 52(%edi), %edi
	movl ptatual, %edx
	movl %edi, 52(%edx)
	movl ptanterior, %edx
	movl %eax, 52(%edx)
	#troca ano
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 60(%eax), %eax
	movl 60(%edi), %edi
	movl ptatual, %edx
	movl %edi, 60(%edx)
	movl ptanterior, %edx
	movl %eax, 60(%edx)
	#troca sexo
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 68(%eax), %eax
	movl 68(%edi), %edi
	movl ptatual, %edx
	movl %edi, 68(%edx)
	movl ptanterior, %edx
	movl %eax, 68(%edx)
	#troca profissao
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 72(%eax), %eax
	movl 72(%edi), %edi
	movl ptatual, %edx
	movl %edi, 72(%edx)
	movl ptanterior, %edx
	movl %eax, 72(%edx)
	#troca salario
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 96(%eax), %eax
	movl 96(%edi), %edi
	movl ptatual, %edx
	movl %edi, 96(%edx)
	movl ptanterior, %edx
	movl %eax, 96(%edx)
	jmp incrementodata
decrementasuperiordata:
	decl %ecx
	jmp loopsuperiordata
ordenavaziadata:
	pushl $msgvazia
	call printf
	addl $4, %esp
retordenadata:
	RET


# ---------- ORDENA POR NOME---------- #
ornome:
	movl ptinicio, %edi #ponteiro anterior
	cmpl $NULL, %edi
	je ordenavazianome
	pushl $titordenanome
	call printf
	addl $4, %esp

	movl $1, %ebx
	movl %ebx, flagdata
	incl %ebx
	movl %ebx, flagnome

	movl tamanholista, %ecx
	#movl 104(%edi), %eax # %eax tem ponteiro atual

loopsuperiornome:
	movl ptinicio, %edi #ponteiro anterior
	movl 104(%edi), %eax # %eax tem ponteiro atual
	movl $1, %ebx
	cmpl %ebx, %ecx
	je retordenadata
loopinferiornome:
	movl %eax, ptatual
	movl %edi, ptanterior
	movl (%eax), %eax
	movl (%edi), %edi
	#pushl %eax
	#pushl %edi
	#call strcasecmp
	#addl $8, %esp
	#cmpl $0, %eax
	cmpl %eax, %edi
	jge trocanome
	jl incrementonome
incrementonome:
	incl %ebx
	cmpl %ebx, %ecx
	je decrementasuperiornome
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 104(%eax), %eax
	movl 104(%edi), %edi
	jmp loopinferiornome
trocanome:
	movl ptatual, %eax
	movl ptanterior, %edi
	#troca nome
	movl (%eax), %eax
	movl (%edi), %edi
	movl ptatual, %edx
	movl %edi, (%edx)
	movl ptanterior, %edx
	movl %eax, (%edx)
	#troca dia
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 44(%eax), %eax
	movl 44(%edi), %edi
	movl ptatual, %edx
	movl %edi, 44(%edx)
	movl ptanterior, %edx
	movl %eax, 44(%edx)
	#troca mês
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 52(%eax), %eax
	movl 52(%edi), %edi
	movl ptatual, %edx
	movl %edi, 52(%edx)
	movl ptanterior, %edx
	movl %eax, 52(%edx)
	#troca ano
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 60(%eax), %eax
	movl 60(%edi), %edi
	movl ptatual, %edx
	movl %edi, 60(%edx)
	movl ptanterior, %edx
	movl %eax, 60(%edx)
	#troca sexo
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 68(%eax), %eax
	movl 68(%edi), %edi
	movl ptatual, %edx
	movl %edi, 68(%edx)
	movl ptanterior, %edx
	movl %eax, 68(%edx)
	#troca profissao
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 72(%eax), %eax
	movl 72(%edi), %edi
	movl ptatual, %edx
	movl %edi, 72(%edx)
	movl ptanterior, %edx
	movl %eax, 72(%edx)
	#troca salario
	movl ptatual, %eax
	movl ptanterior, %edi
	movl 96(%eax), %eax
	movl 96(%edi), %edi
	movl ptatual, %edx
	movl %edi, 96(%edx)
	movl ptanterior, %edx
	movl %eax, 96(%edx)
	jmp incrementonome
decrementasuperiornome:
	decl %ecx
	jmp loopsuperiornome
ordenavazianome:
	pushl $msgvazia
	call printf
	addl $4, %esp
retordenadatanome:
	RET

# ---------- ALTERAÇÃO SALARIAL ---------- #

alteracaosalarial:
	movl ptinicio, %edi
	cmpl $NULL, %edi
	je alterasalarialvazia
	pushl $titalteracaosalariao
	call printf
	addl $4, %esp
	pushl $menusalarial
	call printf
	pushl $opcao
	pushl $formaint
	call  scanf
	addl  $12, %esp
	#pushl $formach    # para remover o enter
	#call  scanf
	#addl  $4, %esp
	cmpl  $1, opcao
	jz    aumentosalarial
	cmpl  $2, opcao
	jz    baixasalarial
	pushl $msgerro
	call  printf
	addl  $4, %esp
	jmp   alteracaosalarial

aumentosalarial:

	pushl $menuaumentosalarial
	call  printf
	pushl $opcao
	pushl $formaint
	call  scanf
	addl  $12, %esp

	cmpl  $1, opcao
	jz    aumentapct
	cmpl  $2, opcao
	jz    aumentasoma
	cmpl  $3, opcao
	jz    aumentamult
	pushl $msgerro
	call  printf
	addl  $4, %esp
	jmp   aumentosalarial

baixasalarial:
	pushl $menubaixasalarial
	call  printf
	pushl $opcao
	pushl $formaint
	call  scanf
	addl  $12, %esp
	cmpl  $1, opcao
	jz    baixapct
	cmpl  $2, opcao
	jz    baixasoma
	cmpl  $3, opcao
	jz    baixadiv
	pushl $msgerro
	call  printf
	addl  $4, %esp
	jmp   baixasalarial

alterasalarialvazia:
	pushl $msgvazia
	call printf
	addl $4, %esp
	jmp retornaalteracaosalarial

aumentapct:
	pushl $pedeporcentagemsalarial
	call printf
	pushl $pct
	pushl $formafloat
	call scanf
	addl $12, %esp
	movl ptinicio, %esi
andapct:
	fldl um
	fldl cem
	fldl pct
	fdiv %st(1), %st(0)
	fadd %st(2), %st(0)
	fldl 96(%edi)
	fmul %st(1), %st(0)
	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)
	addl $8, %esp

	pushl $msgteste
	call printf
	addl $4, %esp
	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andapct

aumentasoma:
	pushl $pedevalorsalarial
	call printf
	pushl $val
	pushl $formafloat
	call scanf
	addl $12, %esp
	fldl val
	movl ptinicio, %edi
andasoma:
	fldl 96(%edi)
	fadd %st(1), %st(0)

	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)

	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andasoma

aumentamult:
	pushl $pedefatorsalarial
	call printf
	pushl $fat
	pushl $formafloat
	call scanf
	addl $12, %esp
	fldl fat
	movl ptinicio, %edi
andamult:
	fldl 96(%edi)
	fmul %st(1), %st(0)

	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)

	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andamult

baixapct:
	pushl $pedeporcentagemsalarial
	call printf
	pushl $pct
	pushl $formafloat
	call scanf
	addl $12, %esp
	movl ptinicio, %edi
andabaixapct:
	fldl cem
	fldl pct
	fldl um
	fdiv %st(1), %st(0)
	fsub %st(1), %st(0)
	fldl 96(%edi)
	fmul %st(1), %st(0)
	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)
	addl $8, %esp

	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andabaixapct

baixasoma:
	pushl $pedevalorsalarial
	call printf
	pushl $val
	pushl $formafloat
	call scanf
	addl $12, %esp
	fldl val
	movl ptinicio, %edi
andabaixasoma:
	fldl 96(%edi)
	fsub %st(1), %st(0)

	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)

	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andabaixasoma

baixadiv:
	pushl $pedefatorsalarial
	call printf
	pushl $fat
	pushl $formafloat
	call scanf
	addl $12, %esp
	fldl fat
	movl ptinicio, %edi
andabaixadiv:
	fldl 96(%edi)
	fdiv %st(1), %st(0)

	subl $8, %esp
	fstpl (%esp)
	popl %eax
	movl %eax, 96(%edi)

	cmpl %edi, ptfim
	je retornaalteracaosalarial
	movl 104(%edi), %edi
	jmp andabaixadiv

retornaalteracaosalarial:
	RET

# ---------- MENU PRINCIPAL ---------- #

menuop:
	pushl $menu
	call  printf
	pushl $opcao
	pushl $formaint
	call  scanf
	addl  $12, %esp
	pushl $formach    # para remover o enter
	call  scanf
	addl  $4, %esp
	cmpl  $1, opcao
	jz    callinsere
	cmpl  $2, opcao
	jz    callremove
	cmpl  $3, opcao
	jz    callconsulta
	cmpl  $4, opcao
	jz    callatualiza
	cmpl  $5, opcao
	jz    calllista
	cmpl  $6, opcao
	jz    callordena
	cmpl  $7, opcao
	jz    callalteracaosalarial
	cmpl  $8, opcao
	jz    fim
	pushl $msgerro
	call  printf
	addl  $4, %esp
	jmp   menuop

callinsere:
	movl flagdata, %eax
	movl flagnome, %ebx
	cmpl $1, %eax
	je callinserenome
	jmp callinseredata

callinserenome:
	call insere
	jmp menuop
callinseredata:
	call inseredata
	jmp menuop

callremove:
	call remove
	jmp menuop

callconsulta:
	call consulta
	jmp menuop

callatualiza:
	call atualiza
	jmp menuop

calllista:
	call lista
	jmp menuop

callordena:
	movl flagdata, %eax
	movl flagnome, %ebx
	cmpl $1, %eax
	je callordenadata
	jmp callordenanome

callordenadata:
	call ordata
	jmp menuop

callordenanome:
	call ornome
	jmp menuop

callalteracaosalarial:
	call alteracaosalarial
	jmp menuop

# ---------- MAIN ---------- #
main:
	pushl $titgeral
	call  printf
	jmp   menuop

# ---------- FIM ---------- #

fim:
	pushl     $0
	call exit
