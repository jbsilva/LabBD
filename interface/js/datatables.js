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
});
