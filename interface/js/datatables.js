$(document).ready(function() {
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

  $('#insertTbl_sala').click(insertTbl_sala);

});

//FUNCOES PARA INSERÇÃO
function insertTbl_sala() {

      var numeroV = $('#numero').val();
      var predioV = $('#predio').val();
      var tipoV = $('#tipo').val();
      var recursosV = $('#recursos').val();
      var caracteristicaV = $('#caracteristicas').val();
      var capacidadeV = $('#capacidade_de_alunos').val();
      $.ajax({
          url:'./php/insert/sala.php',
          type:'POST',
          data:
          {
            numero: numeroV,
            predio: predioV,
            tipo: tipoV,
            recursos: recursosV,
            caracteristicas: caracteristicaV,
            capacidade_de_alunos: capacidadeV 
          },
success:function(data)
{
  alert("Sucess");
},
error:function(data)
{
alert("error");
}
});


    var table = $('#tbl_sala').DataTable();
    table.row.add(
        { 
          numero: $('#numero').val(),
          predio: $('#predio').val(),
          tipo: $('#tipo').val(),
          recursos: $('#recursos').val(),
          caracteristicas: $('#caracteristicas').val(),
          capacidade_de_alunos: $('#capacidade_de_alunos').val() 
        } 
      ).draw();

}

        
