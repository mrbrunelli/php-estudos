<?php date_default_timezone_set('America/Sao_Paulo'); ?>
<?php require_once 'conexao.php'; ?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Hora: <?= date('H:i:s') ?></title>
</head>

<body>



    <div class="container w-25 my-5">
        <label for="pesquisa">Selecione a pesquisa</label>
        <select name="pesquisa" id="pesquisa" class="custom-select">
            <?php
            $sql = "SELECT * FROM anexo";
            $result = mysqli_query($con, $sql);

            foreach ($result as $row) {
                $idanexo = $row["idanexo"];
                $url = $row["anexo"];
                $idpesquisa = $row["pesquisa_idpesquisa"];
                $data = $row["datainclusao"];
            ?>

                <option></option>
                <option><?php echo $url; ?></option>

            <?php
            }
            ?>
        </select>
    </div>

    <div class="row justify-content-around">

        <?php
        $sql = "SELECT * FROM anexo";
        $result = mysqli_query($con, $sql);

        foreach ($result as $row) {
            $idanexo = $row["idanexo"];
            $url = $row["anexo"];
            $idpesquisa = $row["pesquisa_idpesquisa"];
            $data = $row["datainclusao"];

            $titulo = explode('/', $url)
            
        ?>
            <div class="col-3 text-center">
                <p>
                    <a href="./<?= $url; ?>"><?= $idanexo . " - " . $titulo[1]; ?></a><br>
                    <small>Data: <?= $data; ?></small>
                </p>

            </div>
        <?php
        }
        ?>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>