<?php
date_default_timezone_set('America/Sao_Paulo');
include 'conexao.php';
include 'modal.php';
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><?= 'Dia: ' . date('d/m/Y') . ' ' . date('H:i:s')   ?></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>

    <div class="container mt-5">
        <label for="campo">Mensagem</label>
        <textarea id="campo" cols="5" rows="5" class="form-control w-50" placeholder="Digite sua mensagem..."></textarea>
        <button type="button" class="btn btn-success" id="botao" onclick="submit()">Enviar</button>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal" onclick="abreModal(mensagem())">
            Modal
        </button>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
        function abreModal(conteudo) {
            $.ajax({
                // SE EU TIVER MAIS DE UM MODAL EU PRECISO PASSAR UM GET NA URL MODAL.PHP?ACAO=TEXTO
                url: 'modal.php',
                type: 'post',
                data: {
                    conteudo,
                    'nome': 'Matheus Ricardo Brunelli',
                    'idade': 19
                },
                // CALL BACK 
                success: function(result) {
                    console.log(result, conteudo)
                    $('#conteudo').html(conteudo)
                    $('#modal').modal('show')
                    $('#titulo').html('nome')
                },
                error: function(result) {
                    console.log(result, conteudo)
                }
            })
        }

        toastr.options = {
            'closeButton': true,
            'progressBar': true,
            'timeOut': 5000
        }

        function sucesso() {
            $('#modal').modal('hide')
            toastr.success('Configurações salvas com sucesso!')
        }

        function cancela() {
            $('#modal').modal('hide')
            toastr.error('Operação cancelada!')
        }

        function mensagem() {
            let txt = document.querySelector('textarea#campo').value
            return txt
        }

        function submit() {
            let campo = document.querySelector('textarea#campo').value
            toastr.info(campo, 'Mensagem enviada!')
        }
    </script>

</body>

</html>