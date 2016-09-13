<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="utf-8" />
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
  <title>LabBD - 2016/1 </title>
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
  <h2><a href="/index.php" >HOME</a> </h2>
<br/>

Numero: <br/><input type="text" name="numero" id="numero" /> <br/>
Predio: <br/><input type="text" name="predio" id="predio" /> <br/>
Tipo: <br/><input type="text" name="tipo" id="tipo"/> <br/>
Recursos: <br/><input type="text" name="recursos" id="recursos"/> <br/>
Caracteristicas: <br/><input type="text" name="caracteristicas" id="caracteristicas"/> <br/>
Capacidade: <br/><input type="text" name="capacidade_de_alunos" id="capacidade_de_alunos"/> <br/>

    <input type="button" value="Incluir" id="insertTbl_sala" />

  <div class="container">
    <div class="row">
      <div class="col-md-12">

        <ul class="nav nav-tabs">
          <li class="active"><a data-toggle="tab" href="#sala">Salas</a></li>
          <li><a data-toggle="tab" href="#teste1">Menu 1</a></li>
          <li><a data-toggle="tab" href="#teste2">Menu 2</a></li>
        </ul>

        <div class="tab-content">
          <div id="sala" class="tab-pane fade in active">
            <h3>Tabela 'Sala'</h3>
            <table id="tbl_sala" class="table table-striped table-bordered table-hover table-responsive" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Numero</th>
                        <th>Predio</th>
                        <th>Tipo</th>
                        <th>Recursos.</th>
                        <th>Caracteristica</th>
                        <th>Capacidade</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Numero</th>
                        <th>Predio</th>
                        <th>Tipo</th>
                        <th>Recursos.</th>
                        <th>Caracteristica</th>
                        <th>Capacidade</th>
                    </tr>
                </tfoot>
            </table>
          </div>


          <div id="teste1" class="tab-pane fade">
            <h3>Menu 1</h3>
            <p>Some content in menu 1.</p>
          </div>
          <div id="teste2" class="tab-pane fade">
            <h3>Menu 2</h3>
            <p>Some content in menu 2.</p>
          </div>
        </div>


      </div>
    </div>
    <div class="row">
      <footer>

          <div class="col-md-6">
            <span>Trabalho realizado para a disciplina de Laboratório de Banco de Dadados 2016/1</span>
          </div>
          <div class="col-md-6">
            <span style="float:right;">Sob docência de: <a href="#">Profª Marilde Terezinha dos Santos Prado</a></span>
          </div>

        <div class="col-md-12">
          <span>Universidade Federal de São Carlos</span>
        </div>
      </footer>
    </div>
  </div>
</body>
</html>
