
<?php date_default_timezone_set('America/Sao_Paulo'); ?>

<style>
    table,
    h1 {
        font-family: Arial, Helvetica, sans-serif;
    }

    th,
    td {
        padding: 30px;
    }
</style>






<?php

function linha($semana)
{
    echo "<tr>";
    for ($i = 0; $i <= 6; $i++) {
        if (isset($semana[$i])) {
            echo "<td>{$semana[$i]}";
        } else {
            echo "<td></td>";
        }
    }
    echo "</tr>";
}

function calendario()
{
    $dia = 1;
    $semana = array();
    while ($dia <= 31) {
        array_push($semana, $dia);

        if (count($semana) == 7) {
            linha($semana);
            $semana = array();
        }

        $dia++;
    }
    linha($semana);
}

function verificaData()
{
    $hora = date('H:i:s');

    if ($hora >= 5 && $hora <= 12) {
        $hora = $hora . " Bom dia!";
    } elseif ($hora > 12 && $hora < 19) {
        $hora = $hora . " Boa tarde!";
    } elseif ($hora >= 19 && $hora < 5) {
        $hora = $hora . " Boa noite!";
    }

    return $hora;
}

?>





<table border="0" style="box-shadow: 3px 2px 8px 1px rgba(0,0,0, 0.3);">
    <tr>
        <th>Dom</th>
        <th>Seg</th>
        <th>Ter</th>
        <th>Qua</th>
        <th>Qui</th>
        <th>Sex</th>
        <th>Sab</th>
    </tr>
    <?php calendario(); ?>
</table>

<h1><?php echo verificaData(); ?></h1>