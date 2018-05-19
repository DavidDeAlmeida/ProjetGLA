-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 13 Mai 2018 à 13:32
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gla`
--

-- --------------------------------------------------------

--
-- Structure de la table `dvd`
--

CREATE TABLE `dvd` (
  `ID_RESSOURCE` int(11) NOT NULL,
  `NOM_DVD` varchar(60) NOT NULL,
  `NOM_REAL` varchar(40) NOT NULL,
  `ANNEE_SORTIE` year(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `emplacement`
--

CREATE TABLE `emplacement` (
  `ID_RESSOURCE` int(11) NOT NULL,
  `RANGEE` int(11) NOT NULL,
  `ETAGERE` int(11) NOT NULL,
  `NIVEAU` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gestionnaire`
--

CREATE TABLE `gestionnaire` (
  `ID_GEST` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `info_gene`
--

CREATE TABLE `info_gene` (
  `ID_INFOGENE` int(6) NOT NULL,
  `DATE_PUBLI` date NOT NULL,
  `TITRE` varchar(50) NOT NULL,
  `TEXTE` varchar(500) NOT NULL,
  `ID_GEST` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `ID_RESSOURCE` int(11) NOT NULL,
  `AUTEUR` varchar(40) NOT NULL,
  `ANNEE_PUBLI` year(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `ID_MEMBRE` int(5) NOT NULL,
  `SOLDE` float NOT NULL,
  `DEFAILLANT` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `perte`
--

CREATE TABLE `perte` (
  `ID_PERTE` int(11) NOT NULL,
  `ID_RESSOURCE` int(11) NOT NULL,
  `ID_TYPE_PERTE` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `ID_RESERV` int(11) NOT NULL,
  `ID_MEMBRE` int(11) NOT NULL,
  `ID_RESSOURCE` int(11) NOT NULL,
  `DATE_RESERV` date NOT NULL,
  `DATE_RETOUR` date 
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `ID_RESSOURCE` int(11) NOT NULL,
  `NBR_EXEMP` int(11) NOT NULL,
  `CAUTION` float NOT NULL,
  `NBR_JOUR_RETOUR` int(11) NOT NULL,
  `DEREFERENCE` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `revue`
--

CREATE TABLE `revue` (
  `ID_RESSOURCE` int(11) NOT NULL,
  `NOM_REVUE` varchar(50) NOT NULL,
  `MODE_PARUTION` varchar(20) NOT NULL,
  `DATE_PARUTION` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_perte`
--

CREATE TABLE `type_perte` (
  `ID_TYPE_PERTE` int(11) NOT NULL,
  `LIBELLE_PERTE` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_UTILISATEUR` int(5) NOT NULL,
  `NOM` varchar(30) NOT NULL,
  `PRENOM` varchar(30) NOT NULL,
  `MAIL` varchar(50) NOT NULL,
  `MDP` varchar(50) NOT NULL,
  `TYPE_USER` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`ID_RESSOURCE`);

--
-- Index pour la table `emplacement`
--
ALTER TABLE `emplacement`
  ADD PRIMARY KEY (`ID_RESSOURCE`);

--
-- Index pour la table `gestionnaire`
--
ALTER TABLE `gestionnaire`
  ADD KEY `ID_GEST` (`ID_GEST`);

--
-- Index pour la table `info_gene`
--
ALTER TABLE `info_gene`
  ADD PRIMARY KEY (`ID_INFOGENE`),
  ADD KEY `ID_GEST` (`ID_GEST`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`ID_RESSOURCE`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`ID_MEMBRE`);

--
-- Index pour la table `perte`
--
ALTER TABLE `perte`
  ADD PRIMARY KEY (`ID_PERTE`),
  ADD KEY `ID_RESSOURCE` (`ID_RESSOURCE`),
  ADD KEY `ID_TYPE_PERTE` (`ID_TYPE_PERTE`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID_RESERV`),
  ADD KEY `ID_RESSOURCE` (`ID_RESSOURCE`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`ID_RESSOURCE`);

--
-- Index pour la table `revue`
--
ALTER TABLE `revue`
  ADD PRIMARY KEY (`ID_RESSOURCE`);

--
-- Index pour la table `type_perte`
--
ALTER TABLE `type_perte`
  ADD PRIMARY KEY (`ID_TYPE_PERTE`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_UTILISATEUR`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `emplacement`
--
ALTER TABLE `emplacement`
  MODIFY `ID_RESSOURCE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `info_gene`
--
ALTER TABLE `info_gene`
  MODIFY `ID_INFOGENE` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `perte`
--
ALTER TABLE `perte`
  MODIFY `ID_PERTE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID_RESERV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `ID_RESSOURCE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `type_perte`
--
ALTER TABLE `type_perte`
  MODIFY `ID_TYPE_PERTE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_UTILISATEUR` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;