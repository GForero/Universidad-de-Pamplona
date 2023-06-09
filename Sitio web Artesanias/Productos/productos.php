<?php
session_start();

if(!isset($_SESSION['usuario_info']) OR empty($_SESSION['usuario_info']))
  header('Location: ../Login.php');

?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>Artesanías Forcar</title>
  <meta name="description" content="Empresa fabricante y comercializadora de alcancias en yeso." />
  <meta name="author" content="Artesanías Forcar" />
  <meta name="keywords" content="venta,compra,alcancias,cúcuta,forcar" />



  <link rel="shortcut icon" href="../Imagenes/Logo.jpeg" type="image/x-icon">


  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Dancing+Script|Raleway:500,600&display=swap" rel="stylesheet">

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/estilos.css">
</head>

<body>

  <!-- Fixed navbar -->
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="../VistaAdmin.php">Artesanías Forcar</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav pull-right">
          <li>
            <a href="../Pedidos/pedidos.php" class="btn">Pedidos</a>
          </li>
          <li class="active">
            <a href="Productos.php" class="btn">Productos</a>
          </li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <?php print $_SESSION['usuario_info']['usuario']?> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="../cerrar_Sesion.php">Salir </a></li>
            </ul>
          </li>
        </ul>




      </div>
      <!--/.nav-collapse -->
    </div>
  </nav>

  <div class="container" id="main">

    <div class="row">
      <div class="col-md-12">
        <div class="pull-right">
          <a href="form_registrar.php" class="btn btn-primary">
            <span class="glyphicon glyphicon-plus"></span>Nuevo</a>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-12">
        <fieldset>
          <legend>Listado de productos</legend>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>#</th>
                <th>Nombre</th>
                <th>Categoria</th>
                <th>Precio</th>
                <th class="text-center">Imagen</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <?php
              require '../vendor/autoload.php';
              $producto = new Artesanias\productoCarrito;
              $info_producto = $producto->mostrar();


              $cantidad = count($info_producto);
              if ($cantidad > 0) {
                $c = 0;
                for ($x = 0; $x < $cantidad; $x++) {
                  $c++;
                  $item = $info_producto[$x];
              ?>


                  <tr>
                    <td><?php print $c ?></td>
                    <td><?php print $item['titulo'] ?></td>
                    <td><?php print $item['nombre'] ?></td>
                    <td><?php print $item['precio'] ?></td>
                    <td class="text-center">
                      <?php
                      $foto = '../upload/' . $item['imagen'];
                      if (file_exists($foto)) {
                      ?>
                        <img src="<?php print $foto; ?>" width="50">
                      <?php } else { ?>
                        SIN FOTO
                      <?php } ?>
                    </td>
                    <td class="text-center">
                      <a href="../acciones.php?id=<?php print $item['id'] ?>" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>
                      <a href="form_actualizar.php?id=<?php print $item['id']  ?>" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-edit"></span></a>
                    </td>

                  </tr>

                <?php
                }
              } else {

                ?>
                <tr>
                  <td colspan="6">NO HAY REGISTROS</td>
                </tr>

              <?php } ?>


            </tbody>
          </table>
        </fieldset>
      </div>
    </div>
  </div>




  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="../assets/js/jquery.min.js"></script>
  <script src="../assets/js/bootstrap.min.js"></script>

</body>

</html>