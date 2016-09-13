<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1 ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">




  <!--jQuery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!--Bootstrap-->
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!--Datatables-->
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/dataTables.bootstrap.min.css" charset="utf-8">
  <!--Tabs plugin-->
  <script type="text/javascript" src="assets/twitterbootstrap/js/bootstrap-tab.js"></script>
  <!--Custom CSS-->
  <link rel="stylesheet" href="css/stylesheet.css" charset="utf-8">
  <script type="text/javascript" src="js/datatables.js">

  </script>
  <title>LabBD - 2016/1</title>
</head>
<body>
  <header>
  <div class="container-fluid" id="page-header">
    <div class="row">
      <div class="col-md-3">
        <h1>LabBD</h1>
      </div>
        <h1 style="float:right;">Grupos: 4A/5A/6A</h1>
    </div>
  </div>
  </header>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h4>Tabelas:</h4>
        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#pessoa">Pessoas</a></li>
          <li><a data-toggle="tab" href="#emails">Emails</a></li>
          <li><a data-toggle="tab" href="#endereco">Endereços</a></li>
          <li><a data-toggle="tab" href="#docentes">Docentes</a></li>
          <li><a data-toggle="tab" href="#licenca">Licenças</a></li>
          <li><a data-toggle="tab" href="#carga_horaria">Carga Horária</a></li>
          <li><a data-toggle="tab" href="#reuniao">Reunião</a></li>
          <li><a data-toggle="tab" href="#estudante">Estudante</a></li>
          <li><a data-toggle="tab" href="#departamento">Departamento</a></li>
          <li><a data-toggle="tab" href="#disciplina">Disciplina</a></li>
          <li><a data-toggle="tab" href="#ativ_complementar">Ativ. Complementar</a></li>
          <li><a data-toggle="tab" href="#ta">Téc. Administrativo</a></li>
          <li><a data-toggle="tab" href="#calendario">Calendário</a></li>
          <li><a data-toggle="tab" href="#turma">Turma</a></li>
          <li><a data-toggle="tab" href="#conselho">Conselho</a></li>
          <li><a data-toggle="tab" href="#estagio">Estagio</a></li>
          <li><a data-toggle="tab" href="#curso">Curso</a></li>
          <li><a data-toggle="tab" href="#matricula">Matrícula</a></li>
          <li><a data-toggle="tab" href="#pre_req">Pré Requisitos</a></li>        <li><a data-toggle="tab" href="#grade">Grade</a></li>
          <li><a data-toggle="tab" href="#predio">Prédio</a></li>
          <li><a data-toggle="tab" href="#sala">Sala</a></li>
          <li><a data-toggle="tab" href="#alocacao">Alocação</a></li>
          <li><a data-toggle="tab" href="#inscricao">Inscrição</a></li>
          <li><a data-toggle="tab" href="#atividade">Atividade</a></li>
          <li><a data-toggle="tab" href="#proposta">Proposta</a></li>
          <li><a data-toggle="tab" href="#recesso">Recesso</a></li>
          <li><a data-toggle="tab" href="#codigo_turma">Código Turma</a></li>
          <li><a data-toggle="tab" href="#plano_de_ensino">Plano de Ensino</a></li>
          <li><a data-toggle="tab" href="#revisa">Revisa</a></li>
        </ul>

        <div class="tab-content">
          <div id="pessoa" class="tab-pane fade in active">
            <h3>Tabela 'Pessoa'</h3>
            <table id="tbl_pessoa" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Prenome</th>
                        <th>Sobrenome</th>
                        <th>ID Pessoa</th>
                        <th>Tipo Doc.</th>
                        <th>RG</th>
                        <th>Raça</th>
                        <th>Sexo</th>
                        <th>Cidade Natal</th>
                        <th>País Natal</th>
                        <th>UF</th>
                        <th>Data Nasc.</th>
                        <th>Nome Pai</th>
                        <th>Nome Mãe</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Prenome</th>
                        <th>Sobrenome</th>
                        <th>ID Pessoa</th>
                        <th>Tipo Doc.</th>
                        <th>RG</th>
                        <th>Raça</th>
                        <th>Sexo</th>
                        <th>Cidade Natal</th>
                        <th>País Natal</th>
                        <th>UF</th>
                        <th>Data Nasc.</th>
                        <th>Nome Pai</th>
                        <th>Nome Mãe</th>
                    </tr>
                </tfoot>
            </table>
          </div>


          <div id="emails" class="tab-pane fade">
            <h3>Tabela 'Emails'</h3>
            <table id="tbl_emails" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Email</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="endereco" class="tab-pane fade">
            <h3>Tabela 'Endereços'</h3>
            <table id="tbl_endereco" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>CEP</th>
                        <th>País</th>
                        <th>UF</th>
                        <th>Cidade</th>
                        <th>Bairro</th>
                        <th>Complemento</th>
                        <th>Rua</th>
                        <th>DDD</th>
                        <th>Prefixo</th>
                        <th>Número</th>
                        <th>Ramal</th>
                        <th>Tipo End</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>CEP</th>
                        <th>País</th>
                        <th>UF</th>
                        <th>Cidade</th>
                        <th>Bairro</th>
                        <th>Complemento</th>
                        <th>Rua</th>
                        <th>DDD</th>
                        <th>Prefixo</th>
                        <th>Número</th>
                        <th>Ramal</th>
                        <th>Tipo End</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="docentes" class="tab-pane fade">
            <h3>Tabela 'Docentes'</h3>
            <table id="tbl_docente" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Titularidade</th>
                        <th>Alívio</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Titularidade</th>
                        <th>Alívio</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="licenca" class="tab-pane fade">
            <h3>Tabela 'Licenças'</h3>
            <table id="tbl_licenca" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Tipo</th>
                        <th>Documento</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Tipo</th>
                        <th>Documento</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="carga_horaria" class="tab-pane fade">
            <h3>Tabela 'Carga Horária'</h3>
            <table id="tbl_carga_horaria" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Semestre Início</th>
                        <th>Semestre Término</th>
                        <th>Ano Início</th>
                        <th>Ano Término</th>
                        <th>Horas Aula</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID Pessoa</th>
                        <th>Semestre Início</th>
                        <th>Semestre Término</th>
                        <th>Ano Início</th>
                        <th>Ano Término</th>
                        <th>Horas Aula</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="reuniao" class="tab-pane fade">
            <h3>Tabela 'Reunião'</h3>
            <table id="tbl_reuniao" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Nº</th>
                        <th>Data</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Nº</th>
                        <th>Data</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="estudante" class="tab-pane fade">
            <h3>Tabela 'Estudantes'</h3>
            <table id="tbl_estudantes" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Ano Conclusão</th>
                        <th>Ensino Médio</th>
                        <th>RA</th>
                        <th>ID Pessoa</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Ano Conclusão</th>
                        <th>Ensino Médio</th>
                        <th>RA</th>
                        <th>ID Pessoa</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="departamento" class="tab-pane fade">
            <h3>Tabela 'Departamentos'</h3>
            <table id="tbl_departamento" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Centro</th>
                        <th>Campi</th>
                        <th>Nome</th>
                        <th>Sigla</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Centro</th>
                        <th>Campi</th>
                        <th>Nome</th>
                        <th>Sigla</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="disciplina" class="tab-pane fade">
            <h3>Tabela 'Disciplinas'</h3>
            <table id="tbl_disciplina" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Ementa</th>
                        <th>Créditos Práticos</th>
                        <th>Créditos Teóricos</th>
                        <th>Departamento</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Ementa</th>
                        <th>Créditos Práticos</th>
                        <th>Créditos Teóricos</th>
                        <th>Departamento</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="ativ_complementar" class="tab-pane fade">
            <h3>Tabela 'Atividade Complementar'</h3>
            <table id="tbl_atividade_complementar" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Tipo</th>
                        <th>Descrição</th>
                        <th>Carga Horária</th>
                        <th>ID</th>
                        <th>RA Estudante</th>
                        <th>Cód. Disciplina</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Tipo</th>
                        <th>Descrição</th>
                        <th>Carga Horária</th>
                        <th>ID</th>
                        <th>RA Estudante</th>
                        <th>Cód. Disciplina</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="ta" class="tab-pane fade">
            <h3>Tabela 'TAs</h3>
            <table id="tbl_tecnico_administrativo" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="calendario" class="tab-pane fade">
            <h3>Tabela 'Calendário'</h3>
            <table id="tbl_calendario" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Ano</th>
                        <th>Semestre</th>
                        <th>Tipo</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Ano</th>
                        <th>Semestre</th>
                        <th>Tipo</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="turma" class="tab-pane fade">
            <h3>Tabela 'Turma'</h3>
            <table id="tbl_turma" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Cód. Turma</th>
                        <th>Cód. Disciplina</th>
                        <th>Nº de Vagas</th>
                        <th>Horário</th>
                        <th>Dia</th>
                        <th>Ano</th>
                        <th>Semestre</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Cód. Turma</th>
                        <th>Cód. Disciplina</th>
                        <th>Nº de Vagas</th>
                        <th>Horário</th>
                        <th>Dia</th>
                        <th>Ano</th>
                        <th>Semestre</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="conselho" class="tab-pane fade">
            <h3>Tabela 'Conselho'</h3>
            <table id="tbl_conselho" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sigla</th>
                        <th>Tipo</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Sigla</th>
                        <th>Tipo</th>
                        <th>Data Início</th>
                        <th>Data Término</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="estagio" class="tab-pane fade">
            <h3>Tabela 'Estagio'</h3>
            <table id="tbl_estagio" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>País</th>
                      <th>Termo</th>
                      <th>Carta</th>
                      <th>Supervisor</th>
                      <th>Empresa</th>
                      <th>Obrigatório</th>
                      <th>Data Término</th>
                      <th>Data Início</th>
                      <th>RA Estudante</th>
                      <th>ID Supervisor</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>País</th>
                      <th>Termo</th>
                      <th>Carta</th>
                      <th>Supervisor</th>
                      <th>Empresa</th>
                      <th>Obrigatório</th>
                      <th>Data Término</th>
                      <th>Data Início</th>
                      <th>RA Estudante</th>
                      <th>ID Supervisor</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="curso" class="tab-pane fade">
            <h3>Tabela 'Curso'</h3>
            <table id="tbl_curso" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Sigla</th>
                      <th>Nome</th>
                      <th>Duração Média</th>
                      <th>Duração Máxima</th>
                      <th>PPP Aprovado</th>
                      <th>Centro</th>
                      <th>Créditos Necessários</th>
                      <th>Créditos Complementares</th>
                      <th>Créditos Obrigatórios</th>
                      <th>Créditos Optativos</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Sigla</th>
                      <th>Nome</th>
                      <th>Duração Média</th>
                      <th>Duração Máxima</th>
                      <th>PPP Aprovado</th>
                      <th>Centro</th>
                      <th>Créditos Necessários</th>
                      <th>Créditos Complementares</th>
                      <th>Créditos Obrigatórios</th>
                      <th>Créditos Optativos</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="matricula" class="tab-pane fade">
            <h3>Tabela 'Matrícula'</h3>
            <table id="tbl_matricula" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>IRA</th>
                      <th>Cred. Obrigatórios</th>
                      <th>Cred. Optativos</th>
                      <th>Cred. Complementares</th>
                      <th>Perfil</th>
                      <th>Ano Ingresso</th>
                      <th>RA</th>
                      <th>Sigla</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>IRA</th>
                      <th>Cred. Obrigatórios</th>
                      <th>Cred. Optativos</th>
                      <th>Cred. Complementares</th>
                      <th>Perfil</th>
                      <th>Ano Ingresso</th>
                      <th>RA</th>
                      <th>Sigla</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="pre_req" class="tab-pane fade">
            <h3>Tabela 'Pré Requisito'</h3>
            <table id="tbl_pre_requisito" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Disciplina</th>
                      <th>Pré Requisito</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Disciplina</th>
                      <th>Pré Requisito</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="grade" class="tab-pane fade">
            <h3>Tabela 'Grade'</h3>
            <table id="tbl_grade" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Perfil</th>
                      <th>Tipo</th>
                      <th>Sigla</th>
                      <th>Código</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Perfil</th>
                      <th>Tipo</th>
                      <th>Sigla</th>
                      <th>Código</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="predio" class="tab-pane fade">
            <h3>Tabela 'Prédio'</h3>
            <table id="tbl_predio" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Sigla</th>
                      <th>Descricao</th>
                      <th>Imagem</th>
                      <th>Localização Geográfica</th>
                      <th>Mapa Localização</th>
                      <th>Primeira Sala</th>
                      <th>Última Sala</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Sigla</th>
                      <th>Descricao</th>
                      <th>Imagem</th>
                      <th>Localização Geográfica</th>
                      <th>Mapa Localização</th>
                      <th>Primeira Sala</th>
                      <th>Última Sala</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="sala" class="tab-pane fade">
            <h3>Tabela 'Sala'</h3>
            <table id="tbl_sala" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Nº</th>
                      <th>Prédio</th>
                      <th>Tipo</th>
                      <th>Recursos</th>
                      <th>Características</th>
                      <th>Capacidade</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Nº</th>
                      <th>Prédio</th>
                      <th>Tipo</th>
                      <th>Recursos</th>
                      <th>Características</th>
                      <th>Capacidade</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="alocacao" class="tab-pane fade">
            <h3>Tabela 'Alocação'</h3>
            <table id="tbl_alocacao" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Semestre</th>
                      <th>Ano</th>
                      <th>Código Turma</th>
                      <th>Código Disciplina</th>
                      <th>Nº Sala</th>
                      <th>Sigla Prédio</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Semestre</th>
                      <th>Ano</th>
                      <th>Código Turma</th>
                      <th>Código Disciplina</th>
                      <th>Nº Sala</th>
                      <th>Sigla Prédio</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="inscricao" class="tab-pane fade">
            <h3>Tabela 'Inscrição'</h3>
            <table id="tbl_inscricao" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>RA</th>
                      <th>Semestre - Turma</th>
                      <th>Ano - Turma</th>
                      <th>Cód. Turma</th>
                      <th>Cód. Disciplina</th>
                      <th>Média</th>
                      <th>Frequência</th>
                      <th>Resultado</th>
                      <th>Prioridade Inscrição</th>
                      <th>Status de Solicitação</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>RA</th>
                      <th>Semestre - Turma</th>
                      <th>Ano - Turma</th>
                      <th>Cód. Turma</th>
                      <th>Cód. Disciplina</th>
                      <th>Média</th>
                      <th>Frequência</th>
                      <th>Resultado</th>
                      <th>Prioridade Inscrição</th>
                      <th>Status de Solicitação</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="atividade" class="tab-pane fade">
            <h3>Tabela 'Atividade'</h3>
            <table id="tbl_atividade" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>ID</th>
                      <th>Data Início</th>
                      <th>Data Termino</th>
                      <th>Descrição</th>
                      <th>Responsáveis</th>
                      <th>Tipo</th>
                      <th>Ano</th>
                      <th>Semestre</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Data Início</th>
                      <th>Data Termino</th>
                      <th>Descrição</th>
                      <th>Responsáveis</th>
                      <th>Tipo</th>
                      <th>Ano</th>
                      <th>Semestre</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="proposta" class="tab-pane fade">
            <h3>Tabela 'Proposta'</h3>
            <table id="tbl_proposta_int" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Ano</th>
                      <th>Semestre</th>
                      <th>Data Submissão</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Ano</th>
                      <th>Semestre</th>
                      <th>Data Submissão</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="recesso" class="tab-pane fade">
            <h3>Tabela 'Recesso'</h3>
            <table id="tbl_recesso" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>ID</th>
                      <th>Tipo</th>
                      <th>Data Início</th>
                      <th>Data Término</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Tipo</th>
                      <th>Data Início</th>
                      <th>Data Término</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="codigo_turma" class="tab-pane fade">
            <h3>Tabela 'Código Turma'</h3>
            <table id="tbl_codigo_turma" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>ID</th>
                      <th>Cód. Turma</th>
                      <th>Cód. Disciplina</th>
                      <th>Semestre</th>
                      <th>Ano</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>ID</th>
                      <th>Cód. Turma</th>
                      <th>Cód. Disciplina</th>
                      <th>Semestre</th>
                      <th>Ano</th>
                    </tr>
                </tfoot>
            </table>
          </div>

          <div id="plano_de_ensino" class="tab-pane fade">
            <h3>Tabela 'Plano de Ensino'</h3>
            <table id="tbl_plano_de_ensino" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                      <th>Proc. Avaliação</th>
                      <th>Recursos</th>
                      <th>Bibliografia Básica</th>
                      <th>Bibliografia Complementar</th>
                      <th>Objetivos Gerais</th>
                      <th>Objetivos Específicos</th>
                      <th>Estratégia de Ensino</th>
                      <th>Atividades Alunos</th>
                      <th>Observações</th>
                      <th>Atividades EAD</th>
                      <th>Data</th>
                      <th>Situação</th>
                      <th>Duração Tópicos</th>
                      <th>PESCD</th>
                      <th>Distribuição Horas</th>
                      <th>Turma</th>
                      <th>Professor</th>
                      <th>Ementa</th>
                      <th>Requisitos</th>
                      <th>ID Docente</th>
                      <th>Código Turma</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                      <th>Proc. Avaliação</th>
                      <th>Recursos</th>
                      <th>Bibliografia Básica</th>
                      <th>Bibliografia Complementar</th>
                      <th>Objetivos Gerais</th>
                      <th>Objetivos Específicos</th>
                      <th>Estratégia de Ensino</th>
                      <th>Atividades Alunos</th>
                      <th>Observações</th>
                      <th>Atividades EAD</th>
                      <th>Data</th>
                      <th>Situação</th>
                      <th>Duração Tópicos</th>
                      <th>PESCD</th>
                      <th>Distribuição Horas</th>
                      <th>Turma</th>
                      <th>Professor</th>
                      <th>Ementa</th>
                      <th>Requisitos</th>
                      <th>ID Docente</th>
                      <th>Código Turma</th>
                    </tr>
                </tfoot>
            </table>
          </div>


          <div id="revisa" class="tab-pane fade">
              <h3>Tabela 'Revisa'</h3>
              <table id="tbl_revisa" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Parecer</th>
                  <th>Aceitação</th>
                  <th>Data/Hora</th>
                  <th>Revisor</th>
                  <th>Elaborador</th>
                  <th>Cód. Turma</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Parecer</th>
                  <th>Aceitação</th>
                  <th>Data/Hora</th>
                  <th>Revisor</th>
                  <th>Elaborador</th>
                  <th>Cód. Turma</th>
                </tr>
              </tfoot>
            </table>
          </div>

        </div><!-- Tab Content-->


      </div>
    </div>
    <div class="row footer">
      <footer>

          <div class="col-md-6">
            <span>Trabalho realizado para a disciplina de Laboratório de Banco de Dadados 2016/1</span>
          </div>
          <div class="col-md-6">
            <span style="float:right;">Sob docência de: Profª Marilde Terezinha Prado Santos</span>
          </div>

        <div class="col-md-12">
          <span>Universidade Federal de São Carlos</span>
        </div>
      </footer>
    </div>
  </div>
</body>
</html>
