<?php date_default_timezone_set('America/Sao_Paulo');?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dia <?php echo date('d'); ?></title>
</head>

<body>
    <h1>Estamos em <?php echo date('Y'); ?></h1>
    <p>
        Agora são <?php echo date('H'); ?> Horas e <?php echo date('i'); ?> minutos.
    </p>
</body>

</html>