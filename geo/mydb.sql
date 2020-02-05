-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Fev-2020 às 20:53
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `anexo`
--

CREATE TABLE `anexo` (
  `idanexo` int(11) NOT NULL,
  `anexo` text NOT NULL,
  `pesquisa_idpesquisa` int(11) NOT NULL,
  `datainclusao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `anexo`
--

INSERT INTO `anexo` (`idanexo`, `anexo`, `pesquisa_idpesquisa`, `datainclusao`) VALUES
(1, 'pesquisas/POSVENDA-SET-2019.rar', 7, '2020-02-04 18:51:47'),
(2, 'pesquisas/POSVENDA-OUT-2019.rar', 8, '2020-02-04 18:51:47'),
(3, 'pesquisas/POSVENDA-NOV-2019.rar', 9, '2020-02-04 18:51:47'),
(4, 'pesquisas/POSVENDA-DEZ-2019.rar', 10, '2020-02-04 18:51:47'),
(5, 'pesquisa/DEPARTAMENTOS-ABR-2019.rar', 6, '2020-02-04 19:00:38'),
(6, 'pesquisa/DEPARTAMENTOS-SET-2019.rar', 5, '2020-02-04 19:00:38'),
(7, 'pesquisa/SERVICOS-JUL-2019.rar', 3, '2020-02-04 19:00:38'),
(8, 'pesquisa/SERVICOS-DEZ-2019.rar', 4, '2020-02-04 19:00:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `filial`
--

CREATE TABLE `filial` (
  `idfilial` int(11) NOT NULL,
  `fantasia` varchar(255) NOT NULL,
  `idgerenteloja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `filial`
--

INSERT INTO `filial` (`idfilial`, `fantasia`, `idgerenteloja`) VALUES
(1, '246 - Santarém - PA', 2),
(2, '051 - Guaranta do Norte - MT', 3),
(3, '300 - Ponta Porã - MS', 4),
(4, '020 - Sinop - MT', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente_loja`
--

CREATE TABLE `gerente_loja` (
  `idgerenteloja` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `gerente_loja`
--

INSERT INTO `gerente_loja` (`idgerenteloja`, `nome`) VALUES
(1, 'Andre Schafer Pasinato'),
(2, 'Valdir Eva de Oliveira'),
(3, 'Anderson Custodio Anhaia'),
(4, 'Nathan Conceicao Padilha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente_regional`
--

CREATE TABLE `gerente_regional` (
  `idgerenteregional` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `gerente_regional`
--

INSERT INTO `gerente_regional` (`idgerenteregional`, `nome`, `email`) VALUES
(1, 'Anderson Ricardo', 'anderson.ricardo@gazin.com.br'),
(2, 'Erlon Almeida', 'erlon.almeida@gazin.com.br'),
(3, 'Guilherme Caetano', 'guilherme.caetano@gazin.com.br'),
(4, 'Jean Medrado', 'jean.medrado@gazin.com.br'),
(5, 'João Dias', 'joao.dias@gazin.com.br'),
(6, 'Leandro Afonso', 'leandro.afonso@gazin.com.br'),
(7, 'Luis Custódio', 'custodio@gazin.com.br'),
(8, 'Marcelo de Lima', 'marcelo.delima@gazin.com.br'),
(9, 'Nicareli Neves', 'nicareli.neves@gazin.com.br'),
(10, 'Jose Ronildo', 'jose.silva@gazin.com.br'),
(11, 'Valter Santos', 'valter.santos@gazin.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `negocio`
--

CREATE TABLE `negocio` (
  `idnegocio` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `negocio`
--

INSERT INTO `negocio` (`idnegocio`, `descricao`) VALUES
(1, 'Varejo'),
(2, 'Indústria'),
(3, 'Atacado'),
(4, 'Paranatec');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pesquisa`
--

CREATE TABLE `pesquisa` (
  `idpesquisa` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data` date NOT NULL,
  `pesquisa_categoria_idpesquisacategoria` int(11) NOT NULL,
  `filial_idfilial` int(11) DEFAULT NULL,
  `gerente_regional_idgerenteregional` int(11) DEFAULT NULL,
  `gerente_loja_idgerenteloja` int(11) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `negocio_idnegocio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pesquisa`
--

INSERT INTO `pesquisa` (`idpesquisa`, `nome`, `data`, `pesquisa_categoria_idpesquisacategoria`, `filial_idfilial`, `gerente_regional_idgerenteregional`, `gerente_loja_idgerenteloja`, `usuario_idusuario`, `negocio_idnegocio`) VALUES
(3, 'ACOMPANHAMENTO DE SERVIÇOS - JULHO', '2019-07-01', 2, NULL, NULL, NULL, 1, 4),
(4, 'ACOMPANHAMENTO DE SERVIÇOS - DEZEMBRO', '2019-12-01', 2, NULL, NULL, NULL, 1, 4),
(5, 'AVALIAÇÃO DE DEPARTAMENTOS - SETEMBRO', '2019-09-01', 3, NULL, NULL, NULL, 1, 1),
(6, 'AVALIAÇÃO DE DEPARTAMENTOS - ABRIL', '2019-04-01', 3, NULL, NULL, NULL, 1, 1),
(7, 'PÓS-VENDA - SETEMBRO', '2019-09-01', 1, NULL, NULL, NULL, 1, 1),
(8, 'PÓS-VENDA - OUTUBRO', '2019-10-01', 1, NULL, NULL, NULL, 1, 1),
(9, 'PÓS-VENDA - NOVEMBRO', '2019-11-01', 1, NULL, NULL, NULL, 1, 1),
(10, 'PÓS-VENDA - DEZEMBRO', '2019-12-01', 1, NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pesquisa_categoria`
--

CREATE TABLE `pesquisa_categoria` (
  `idpesquisacategoria` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pesquisa_categoria`
--

INSERT INTO `pesquisa_categoria` (`idpesquisacategoria`, `descricao`) VALUES
(1, 'Pós-venda'),
(2, 'Acompanhamento de Serviços'),
(3, 'Avaliação de Departamentos'),
(4, 'Anual'),
(5, 'Avaliação de Gerente'),
(6, 'Inativos'),
(7, 'Diversos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `usuariotipo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `senha`, `usuariotipo`) VALUES
(1, 'Vinicius Marques Mazine', 'vinicius.marques@gazin.com.br', 'aa8b748a4ec62f4c0efe89227304ebb9', 'A'),
(2, 'Matheus Ricardo Brunelli', 'matheus.brunelli@gazin.com.br', 'aa8b748a4ec62f4c0efe89227304ebb9', 'A'),
(3, 'Eliane Glaucia dos Santos', 'eliane.santos@gazin.com.br', 'aa8b748a4ec62f4c0efe89227304ebb9', 'B');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `anexo`
--
ALTER TABLE `anexo`
  ADD PRIMARY KEY (`idanexo`),
  ADD KEY `fk_anexo_pesquisa1_idx` (`pesquisa_idpesquisa`);

--
-- Índices para tabela `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`idfilial`),
  ADD KEY `fk_idgerenteloja` (`idgerenteloja`);

--
-- Índices para tabela `gerente_loja`
--
ALTER TABLE `gerente_loja`
  ADD PRIMARY KEY (`idgerenteloja`);

--
-- Índices para tabela `gerente_regional`
--
ALTER TABLE `gerente_regional`
  ADD PRIMARY KEY (`idgerenteregional`);

--
-- Índices para tabela `negocio`
--
ALTER TABLE `negocio`
  ADD PRIMARY KEY (`idnegocio`);

--
-- Índices para tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  ADD PRIMARY KEY (`idpesquisa`),
  ADD KEY `fk_pesquisa_pesquisa_categoria_idx` (`pesquisa_categoria_idpesquisacategoria`),
  ADD KEY `fk_pesquisa_filial1_idx` (`filial_idfilial`),
  ADD KEY `fk_pesquisa_gerente_regional1_idx` (`gerente_regional_idgerenteregional`),
  ADD KEY `fk_pesquisa_gerente_loja1_idx` (`gerente_loja_idgerenteloja`),
  ADD KEY `fk_pesquisa_usuario1_idx` (`usuario_idusuario`),
  ADD KEY `fk_pesquisa_negocio1_idx` (`negocio_idnegocio`);

--
-- Índices para tabela `pesquisa_categoria`
--
ALTER TABLE `pesquisa_categoria`
  ADD PRIMARY KEY (`idpesquisacategoria`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `anexo`
--
ALTER TABLE `anexo`
  MODIFY `idanexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `filial`
--
ALTER TABLE `filial`
  MODIFY `idfilial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `gerente_loja`
--
ALTER TABLE `gerente_loja`
  MODIFY `idgerenteloja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `gerente_regional`
--
ALTER TABLE `gerente_regional`
  MODIFY `idgerenteregional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `negocio`
--
ALTER TABLE `negocio`
  MODIFY `idnegocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  MODIFY `idpesquisa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pesquisa_categoria`
--
ALTER TABLE `pesquisa_categoria`
  MODIFY `idpesquisacategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `anexo`
--
ALTER TABLE `anexo`
  ADD CONSTRAINT `fk_anexo_pesquisa1` FOREIGN KEY (`pesquisa_idpesquisa`) REFERENCES `pesquisa` (`idpesquisa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `filial`
--
ALTER TABLE `filial`
  ADD CONSTRAINT `fk_idgerenteloja` FOREIGN KEY (`idgerenteloja`) REFERENCES `gerente_loja` (`idgerenteloja`);

--
-- Limitadores para a tabela `pesquisa`
--
ALTER TABLE `pesquisa`
  ADD CONSTRAINT `fk_pesquisa_filial1` FOREIGN KEY (`filial_idfilial`) REFERENCES `filial` (`idfilial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesquisa_gerente_loja1` FOREIGN KEY (`gerente_loja_idgerenteloja`) REFERENCES `gerente_loja` (`idgerenteloja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesquisa_gerente_regional1` FOREIGN KEY (`gerente_regional_idgerenteregional`) REFERENCES `gerente_regional` (`idgerenteregional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesquisa_negocio1` FOREIGN KEY (`negocio_idnegocio`) REFERENCES `negocio` (`idnegocio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesquisa_pesquisa_categoria` FOREIGN KEY (`pesquisa_categoria_idpesquisacategoria`) REFERENCES `pesquisa_categoria` (`idpesquisacategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pesquisa_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
