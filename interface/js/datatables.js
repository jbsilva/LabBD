$(document).ready(function() {
  //Pessoas
  $('#tbl_pessoa').DataTable( {
      ajax: {
          url: './php/tables/pessoa.php',
          dataSrc: ''
      },
      columns: [
        { "data": "prenome" },
        { "data": "sobrenome" },
        { "data": "pessoa_id" },
        { "data": "tipo_doc" },
        { "data": "rg" },
        { "data": "raca" },
        { "data": "sexo" },
        { "data": "cidade_nasc" },
        { "data": "pais_nasc" },
        { "data": "uf_nasc" },
        { "data": "data_nasc" },
        { "data": "pai_filiacao" },
        { "data": "mae_filiacao" }
    ]
  } );
  //Emails
  $('#tbl_emails').DataTable( {
      ajax: {
          url: './php/tables/emails.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pessoa" },
        { "data": "email" }
    ]
  } );
  //Endereços
  $('#tbl_endereco').DataTable( {
      ajax: {
          url: './php/tables/endereco.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pessoa" },
        { "data": "cep_end" },
        { "data": "pais_end" },
        { "data": "uf_end" },
        { "data": "cidade_end" },
        { "data": "bairro_end" },
        { "data": "complemento_end" },
        { "data": "rua_end" },
        { "data": "ddd_end_tel" },
        { "data": "prefixo_end_tel" },
        { "data": "numero_end_tel" },
        { "data": "ramal_end_tel" },
        { "data": "tipo_end" }
    ]
  } );
  //Docentes
  $('#tbl_docente').DataTable( {
      ajax: {
          url: './php/tables/docentes.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pessoa" },
        { "data": "titularidade" },
        { "data": "alivio" }
    ]
  } );
  //Licença
  $('#tbl_licenca').DataTable( {
      ajax: {
          url: './php/tables/licencas.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pessoa_id" },
        { "data": "tipo" },
        { "data": "documento" },
        { "data": "data_inicio" },
        { "data": "data_final" }
    ]
  } );
  //Carga Horária
  $('#tbl_carga_horaria').DataTable( {
      ajax: {
          url: './php/tables/carga_horaria.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pessoa" },
        { "data": "semestre_inicio" },
        { "data": "semestre_termino" },
        { "data": "ano_inicio" },
        { "data": "ano_termino" },
        { "data": "horas_aula" }
    ]
  } );
  //Reunião
  $('#tbl_reuniao').DataTable( {
      ajax: {
          url: './php/tables/reuniao.php',
          dataSrc: ''
      },
      columns: [
        { "data": "numero" },
        { "data": "data" }
    ]
  } );
  //Estudantes
  $('#tbl_estudantes').DataTable( {
      ajax: {
          url: './php/tables/estudante.php',
          dataSrc: ''
      },
      columns: [
        { "data": "ano_conclusao" },
        { "data": "ensino_medio" },
        { "data": "ra" },
        { "data": "pessoa_id" }
    ]
  } );
  //Departamentos
  $('#tbl_departamento').DataTable( {
      ajax: {
          url: './php/tables/departamentos.php',
          dataSrc: ''
      },
      columns: [
        { "data": "centro" },
        { "data": "campi" },
        { "data": "nome" },
        { "data": "sigla" }
    ]
  } );
  //Disciplina
  $('#tbl_disciplina').DataTable( {
      ajax: {
          url: './php/tables/disciplina.php',
          dataSrc: ''
      },
      columns: [
        { "data": "codigo" },
        { "data": "nome" },
        { "data": "ementa" },
        { "data": "creditospraticos" },
        { "data": "creditosteoricos" },
        { "data": "departamento" }
    ]
  } );
  //Atividade Complementar
  $('#tbl_atividade_complementar').DataTable( {
      ajax: {
          url: './php/tables/ativ_complementar.php',
          dataSrc: ''
      },
      columns: [
        { "data": "tipo" },
        { "data": "descricao" },
        { "data": "carga_horaria" },
        { "data": "id" },
        { "data": "ra_ativ" },
        { "data": "codigo_disciplina" }
    ]
  } );
  //Técnico Administrativo
  $('#tbl_tecnico_administrativo').DataTable( {
      ajax: {
          url: './php/tables/ta.php',
          dataSrc: ''
      },
      columns: [
        { "data": "id" }
    ]
  } );
  //Calendário
  $('#tbl_calendario').DataTable( {
      ajax: {
          url: './php/tables/calendario.php',
          dataSrc: ''
      },
      columns: [
        { "data": "ano" },
        { "data": "semestre" },
        { "data": "tipo" },
        { "data": "data_ini" },
        { "data": "data_ter" }
    ]
  } );
  //Turma
  $('#tbl_turma').DataTable( {
      ajax: {
          url: './php/tables/turma.php',
          dataSrc: ''
      },
      columns: [
        { "data": "codigoturma" },
        { "data": "codigodisciplina" },
        { "data": "numerodevagas" },
        { "data": "horario" },
        { "data": "dia" },
        { "data": "ano" },
        { "data": "semestre" }
    ]
  } );//Conselho
  //Conselho
  $('#tbl_conselho').DataTable( {
      ajax: {
          url: './php/tables/conselho.php',
          dataSrc: ''
      },
      columns: [
        { "data": "sigla" },
        { "data": "tipo" },
        { "data": "datainiciovigencia" },
        { "data": "datafimvigencia" }
    ]
  } );
  //Estágio
  $('#tbl_estagio').DataTable( {
      ajax: {
          url: './php/tables/estagio.php',
          dataSrc: ''
      },
      columns: [
        { "data": "pais_atuacao" },
        { "data": "termo_compromisso" },
        { "data": "carta_avaliacao" },
        { "data": "supervisor_empresa" },
        { "data": "empresa" },
        { "data": "obrigatorio" },
        { "data": "data_termino" },
        { "data": "data_inicio" },
        { "data": "estudante_ra" },
        { "data": "supervisor_id" }
    ]
  } );
  //Curso
  $('#tbl_curso').DataTable( {
      ajax: {
          url: './php/tables/curso.php',
          dataSrc: ''
      },
      columns: [
        { "data": "sigla" },
        { "data": "nome" },
        { "data": "duracaomedia" },
        { "data": "duracaomaxima" },
        { "data": "PPPaprovado" },
        { "data": "centro" },
        { "data": "creditosNecessarios" },
        { "data": "creditosComplementares" },
        { "data": "creditosObrigatorios" },
        { "data": "creditosOptativos" }
    ]
  } );
  //Matrícula
  $('#tbl_matricula').DataTable( {
      ajax: {
          url: './php/tables/matricula.php',
          dataSrc: ''
      },
      columns: [
        { "data": "ira" },
        { "data": "creditos_obrigatorios" },
        { "data": "creditos_optativos" },
        { "data": "creditos_complementares" },
        { "data": "perfil" },
        { "data": "ano_ingresso" },
        { "data": "ra" },
        { "data": "sigla" }
    ]
  } );
  //Pré Requisito
  $('#tbl_pre_requisito').DataTable( {
      ajax: {
          url: './php/tables/pre_req.php',
          dataSrc: ''
      },
      columns: [
        { "data": "disciplina" },
        { "data": "preRequisito" }
    ]
  } );
  //Grade
  $('#tbl_grade').DataTable( {
      ajax: {
          url: './php/tables/grade.php',
          dataSrc: ''
      },
      columns: [
        { "data": "perfil" },
        { "data": "tipo" },
        { "data": "sigla" },
        { "data": "codigo" }
    ]
  } );
  //Prédio
  $('#tbl_predio').DataTable( {
      ajax: {
          url: './php/tables/predio.php',
          dataSrc: ''
      },
      columns: [
        { "data": "sigla" },
        { "data": "descricao" },
        { "data": "imagem" },
        { "data": "localizacao_geografica" },
        { "data": "mapa_localizacao" },
        { "data": "primeira_sala" },
        { "data": "ultima_sala" }
    ]
  } );
  //Sala
  $('#tbl_sala').DataTable( {
      ajax: {
          url: './php/tables/sala.php',
          dataSrc: ''
      },
      columns: [
        { "data": "numero" },
        { "data": "predio" },
        { "data": "tipo" },
        { "data": "recursos" },
        { "data": "caracteristicas" },
        { "data": "capacidade_de_alunos" }
    ]
  } );
  //Alocação
  $('#tbl_alocacao').DataTable( {
      ajax: {
          url: './php/tables/alocacao.php',
          dataSrc: ''
      },
      columns: [
        { "data": "semestre" },
        { "data": "ano" },
        { "data": "codigoTurma" },
        { "data": "codigoDisciplina" },
        { "data": "numeroSala" },
        { "data": "siglaPredio" }
    ]
  } );
  //Inscrição
  $('#tbl_inscricao').DataTable( {
      ajax: {
          url: './php/tables/inscricao.php',
          dataSrc: ''
      },
      columns: [
        { "data": "ra" },
        { "data": "semestreTurma" },
        { "data": "anoTurma" },
        { "data": "codigoTurma" },
        { "data": "codigoDisciplina" },
        { "data": "media" },
        { "data": "frequencia"},
        { "data": "resultado" },
        { "data": "prioridadeDeInscricao" },
        { "data": "statusDeSolicitacao" }
    ]
  } );
  //Atividade
  $('#tbl_atividade').DataTable( {
      ajax: {
          url: './php/tables/atividade.php',
          dataSrc: ''
      },
      columns: [
        { "data": "idAtividade" },
        { "data": "dataInicio" },
        { "data": "dataTermino" },
        { "data": "descricao" },
        { "data": "responsaveis" },
        { "data": "tipo" },
        { "data": "ano"},
        { "data": "semestre" }
    ]
  } );
  //Proposta
  $('#tbl_proposta_int').DataTable( {
      ajax: {
          url: './php/tables/propostaInt.php',
          dataSrc: ''
      },
      columns: [
        { "data": "ano" },
        { "data": "semestre" },
        { "data": "data_submissao" }
    ]
  } );
  //Recesso
  $('#tbl_recesso').DataTable( {
      ajax: {
          url: './php/tables/recesso.php',
          dataSrc: ''
      },
      columns: [
        { "data": "id" },
        { "data": "tipo" },
        { "data": "data_ini" },
        { "data": "data_ter" }
    ]
  } );
  //Código Turma
  $('#tbl_codigo_turma').DataTable( {
      ajax: {
          url: './php/tables/codigo_turma.php',
          dataSrc: ''
      },
      columns: [
        { "data": "id" },
        { "data": "codigoturma" },
        { "data": "codigodisciplina" },
        { "data": "semestre" },
        { "data": "ano" }
    ]
  } );
  //Plano de Ensino
  $('#tbl_plano_de_ensino').DataTable( {
      ajax: {
          url: './php/tables/plano_de_ensino.php',
          dataSrc: ''
      },
      columns: [
        { "data": "procedimento_avaliacao" },
        { "data": "recursos" },
        { "data": "bibliografia_basica" },
        { "data": "bibliografia_complementar" },
        { "data": "objetivos_gerais" },
        { "data": "objetivos_especificos" },
        { "data": "estrategia_ensino" },
        { "data": "atividades_alunos" },
        { "data": "observacoes" },
        { "data": "atividades_ead" },
        { "data": "data" },
        { "data": "situacao" },
        { "data": "duracao_topicos" },
        { "data": "pescd" },
        { "data": "distribuicao_horas" },
        { "data": "turma" },
        { "data": "professor" },
        { "data": "ementa" },
        { "data": "requisitos" },
        { "data": "idDocente" },
        { "data": "codigoTurma" }
    ]
  } );
  //Revisa
  $('#tbl_revisa').DataTable( {
      ajax: {
          url: './php/tables/revisa.php',
          dataSrc: ''
      },
      columns: [
        { "data": "parecer" },
        { "data": "aceitacao" },
        { "data": "data_hora" },
        { "data": "docente_revisa" },
        { "data": "docente_elabora" },
        { "data": "codigoTurma"}
    ]
  } );

});
