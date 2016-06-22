# Divisão de Trabalho


## Grupo 4A

- Plano de Ensino e Reunião (André)
- Técnico Administrativo e Conselho (Limão)
- Membro e Ata (Wellyson)
- Contribuição e Participa (Lucas Bataglia)


## Grupo 5A:
	
- Curso (Eduardo Marinho)
- Estágio (Julio)
- Atividade Complementar (Rodrigo Teixeira Garcia)
- Turma (Vitor Rocha)
- Disciplina (Vitor Rocha)
- Departamento (Rodrigo Teixeira Garcia)
- Estudante (Pedro Barbosa)
- Matrícula (Pedro Barbosa)
- Grade (Eduardo Marinho)
- Alocação (Vitor e Pedro)
- Inscrição (Vitor e Pedro)


## Grupo 6A:

- Pessoa (Murilo Guedes)
- Docente (Murilo Guedes) 
- relacionamento responsável/ministra
- Prédio(Raphael Henrique)
- Sala (Henrique Savelli)
- Atividade (Gabriel Palomino)
- Calendário (Vinícius Carvalho)

# Comentários

Coloquei aqui coisas que notei serem diferentes do modelo conceitual. As coisas aqui podem estar erradas, estranhas, confusas ou simplesmente sugiro que sejam repensadas. É importante que todo mundo veja, dando especial atenção para as tabelas referentes ao seu próprio grupo (e avisando os colegas do grupo caso necessário).

Pelo que eu entendi, o nome das coisas são:

Modelo Conceitual == Diagrama Bolado
Modelo Físico == os scripts que estão no github

## Grupo 4A

### Conselho

- Não existe o atributo "sigla" no esquema conceitual. Verifique o requisito do seu grupo/perguntas respondidas pela professora, e caso realmente seja para ter a "sigla", devemos colocar no modelo conceitual.

### Membro

- Se eu entendi direito, a tabela está usando "cpf" como identificador do docente. Foi decidido (a várias semanas atrás) que o identificador de pessoa (e por consequência, de docente) seria "id". Por favor, verifique a tabela de origem antes de fazer uma FK.
- Está faltando uma FK para Conselho, uma vez que um membro tem que pertencer à um conselho. DICA: relacionamentos NxN possuem como PK as PK de ambas as entidades que estão se relacionando.
- Provavelmente deveria também ser inserido dentro da PK, a data de início de vigência.
- Acredito que também é de responsabilidade do responsável da tabela Membro de ajustar a tabela Participa para que esta segunda esteja condizentes com as alterações da tabela Membro.

### Ata

- Será que VARCHAR(256) é o suficiente para os atributos "decisoes", "pautas", "topicos" e "resumos"? Acho que existem atributos para textos maiores, mas desconheço. Se possível, dê uma olhada nisso :)

### Contribuição

- FALTANDO: Atualmente, esta tabela não exista no nosso modelo físico.
- Acredito que esta tabela seja responsabilidade do responsável pela tabela Ata e do responsável pela tabela Membro.

### Plano de Ensino

- REVISAR: A tabela está na forma de comentário. O responsável precisa rever ela, descomentar ela e verificar se ela está funcionando corretamente.

### Revisa

- FALTANDO: Atualmente, a tabela não existe no nosso modelo físico.
- Acredito que esta tabela seja responsabilidade do responsável pela tabela Plano de Ensino.

## Grupo 5A

### Estágio

- De acordo com o esquema conceitual, supervisor de estágio não é PK (e acredito que não deveria ser).

### Atividade Complementar

- O atributo "ra" (FK para aluno) deveria também fazer parte da PK, de acordo com o esquema conceitual.

### Curso

- Acredito que não deveria haver um atributo chamado "créditos necessários". Tem no diagrama conceitual como atributo composto, mas isso acaba sendo ignorado a trazer para o esquema físico.

## Grupo 6A

### Nacional & Estrangeiro

- FALTANDO: Inexistentes no modelo físico.
- Acredito que seja responsabilidade do responsável pela tabela Pessoa.

### Endereço

- No modelo físico, o discriminador está como CEP. Porém, de acordo com o modelo conceitual, o discriminador deveria ser Tipo (Local ou Origem).
- Acredito que está faltando o atributo "número" (número da casa).

### Docente

- Alívio integral/parcial: básicamente, rever que porra é essa. Quem for encarregado desta tabela, por favor _verifique o requisito_ do seu grupo e verifique o que diabos é saporra aqui. Caso seja "tipo de alívio: integral ou parcial", seria só um atributo chamado "alívio" e conteria ou o valor "integral" ou "parcial".

### Carga Horária

- Acho que os discriminadores deveriam ser ano inicial + semestre inicial, e não só semestre inicial. Acredito que o atributo semestre (inicial) só se refere se é 1º ou 2º semestre do ano.
- Também notei que não há população alguma dessa tabela.

### Licença

- FALTANDO: Atualmente, não existe a tabela Licença no nosso modelo físico.
- Acredito que seja responsabilidade do responsável pela tabela Docente.

### Sala

- Repensar se o atributo "tipo" deve ser mapiado para o esquema lógico. Se sim, devemos mudar o esquema conceitual.

### Recesso

- FALTANDO: Atualmente, a tabela não existe no nosso modelo físico.
- Acredito que esta tabela seja responsabilidade do responsável pela tabela Calendário.

### Atividade

- Não sei se faz sentido a PK ser únicamente data de início/fim. É impossível que haja duas atividades que acontecem no mesmo dia? Acredito que para melhor solucionar este problema, seria bom _rever os requisitos_ do grupo e/ou perguntas respondidas pela professora.

### Contém

- FALTANDO: Atualmente, a tabela não existe no nosso modelo físico.
- Acredito que esta tabela seja responsabilidade do responsável pela tabela Atividade.
