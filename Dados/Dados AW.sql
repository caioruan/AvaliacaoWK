-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 07-Mar-2021 às 03:58
-- Versão do servidor: 5.7.25
-- versão do PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `CODIGO` int(11) NOT NULL,
  `NOME` varchar(100) DEFAULT NULL,
  `CIDADE` varchar(100) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`CODIGO`, `NOME`, `CIDADE`, `UF`) VALUES
(1, 'BENE PANI FABRICA DE PANIFICAÇÃO LTDA', 'NATAL', 'RN'),
(2, ' HOTEL ARAM NATAL MAR', 'NATAL', 'RN'),
(3, 'SAL EMPREENDIMENTOS LTDA', 'NATAL', 'RN'),
(4, 'GJP ADMINISTRADORA DE HOTEIS LTDA', 'NATAL', 'RN'),
(5, 'HOTEL ARAM PONTA NEGRA', 'NATAL', 'RN'),
(6, 'HOTEL ARAM BEACH', 'NATAL', 'RN'),
(7, 'HOTEL ARAM IMIRÁ', 'NATAL', 'RN'),
(8, 'CONCEITO ALIMENTOS LTDA-ME', 'NATAL', 'RN'),
(9, 'HOTEL PRAIA BONITA SERVIÇOS DE HOTELARIA', 'NATAL', 'RN'),
(10, 'ALIMENTOS GF EIRELI', 'NATAL', 'RN'),
(11, 'MARSOL HOTEIS E TURISMO S/A', 'NATAL', 'RN'),
(12, 'NATAL PONTA NEGRA HOTEL LTDA', 'NATAL', 'RN'),
(13, 'VISUAL PRAIA HOTEL LTDA', 'NATAL', 'RN'),
(14, 'LATAN COMERCIO DE ALIMENTOS E SERVIÇOS LTDA-ME', 'NATAL', 'RN'),
(15, 'SUPERMERCADO MONTEALEGRENSE LTDA', 'NATAL', 'RN'),
(16, 'NARCISO GAS', 'NATAL', 'RN'),
(17, 'NCE MARQUES COMERCIO E SERVICO', 'NATAL', 'RN'),
(18, 'NATAL ETIQUETAS', 'NATAL', 'RN'),
(19, 'HOLANDA AGRONEGOCIOS LTDA', 'NATAL', 'RN'),
(20, 'POSTO PIUM LTDA', 'NATAL', 'RN');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `CODIGO` int(11) NOT NULL,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `PRECO_VENDA` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`CODIGO`, `DESCRICAO`, `PRECO_VENDA`) VALUES
(1, 'MINI CROISSANT RECH. CHOCOLATE', '33.50'),
(2, 'MINI CROISSANT RECH. GOIABADA', '33.50'),
(3, 'PÃO ITALIANO 400G', '37.90'),
(4, 'PÃO 12 GRÃOS 30G', '37.90'),
(5, 'PÃO AUSTRALIANO 30G', '37.90'),
(6, 'GRISSINI', '37.90'),
(7, 'BOLINHO DE CARNE DE SOL', '33.90'),
(8, 'RISOLES DE FRANGO', '33.90'),
(9, 'PETIT FOUR DOCE', '35.90'),
(10, 'COXINHA DE FRANGO', '33.90'),
(11, 'MINI CROISSANT RECHEADO CHOCOLATE CONGELADO', '33.50'),
(12, 'GRISSINI', '37.90'),
(13, 'PÃO 12 GRÃOS 30G', '37.90'),
(14, 'PÃO ITALIANO 400G', '37.90'),
(15, 'PÃO AUSTRALIANO 30G', '37.90'),
(16, 'PETIT FOUR DOCE', '35.90'),
(17, 'RISOLES DE FRANGO', '33.90'),
(18, 'BOLINHO DE CARNE DE SOL', '33.90'),
(19, 'COXINHA DE FRANGO', '33.90'),
(20, 'MINI CROISSANT RECH. GOIABADA', '33.50');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `CODIGO` int(11) NOT NULL,
  `EMISSAO` date DEFAULT NULL,
  `CLIENTE` int(11) NOT NULL,
  `TOTAL` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`CODIGO`, `EMISSAO`, `CLIENTE`, `TOTAL`) VALUES
(1, '2006-03-20', 2, '25.00'),
(2, '2006-03-20', 2, '25.00'),
(3, '2021-03-06', 2, '23.00'),
(4, '2021-03-06', 3, '37.90'),
(5, '2021-03-06', 3, '33.50'),
(6, '2021-03-06', 3, '33.50'),
(7, '2021-03-06', 3, '33.50'),
(8, '2021-03-06', 3, '151.60'),
(9, '2021-03-06', 4, '189.50'),
(11, '2021-03-06', 3, '100.50'),
(14, '2021-03-06', 3, '37.90');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendaitem`
--

CREATE TABLE `vendaitem` (
  `CODIGO` int(11) NOT NULL,
  `VENDA` int(11) DEFAULT NULL,
  `PRODUTO` int(11) DEFAULT NULL,
  `QUANTIDADE` decimal(18,2) DEFAULT NULL,
  `VALOR_UNITARIO` decimal(18,2) DEFAULT NULL,
  `TOTAL` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendaitem`
--

INSERT INTO `vendaitem` (`CODIGO`, `VENDA`, `PRODUTO`, `QUANTIDADE`, `VALOR_UNITARIO`, `TOTAL`) VALUES
(3, 1, 2, '1.00', '33.50', '33.50'),
(5, 5, 2, '1.00', '33.50', '33.50'),
(6, 6, 2, '1.00', '33.50', '33.50'),
(7, 7, 2, '1.00', '33.50', '33.50'),
(8, 8, 5, '4.00', '37.90', '151.60'),
(9, 9, 5, '5.00', '37.90', '189.50'),
(11, 11, 2, '3.00', '33.50', '100.50'),
(14, 14, 4, '1.00', '37.90', '37.90');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CODIGO`),
  ADD UNIQUE KEY `IDX_CODIGO` (`CODIGO`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `IDX_CODIGO` (`CODIGO`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `IDX_CLIENTE` (`CLIENTE`),
  ADD KEY `IDX_CODIGO` (`CODIGO`) USING BTREE;

--
-- Indexes for table `vendaitem`
--
ALTER TABLE `vendaitem`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `IDX_CODIGO` (`CODIGO`),
  ADD KEY `IDX_PRODUTO` (`PRODUTO`),
  ADD KEY `IDX_VENDA` (`VENDA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157022;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `vendaitem`
--
ALTER TABLE `vendaitem`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `FK_VENDA_CLIENTE` FOREIGN KEY (`CLIENTE`) REFERENCES `clientes` (`CODIGO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendaitem`
--
ALTER TABLE `vendaitem`
  ADD CONSTRAINT `FK_VENDAITEM_PRODUTO` FOREIGN KEY (`PRODUTO`) REFERENCES `produtos` (`CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VENDAITEM_VENDA` FOREIGN KEY (`VENDA`) REFERENCES `venda` (`CODIGO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
