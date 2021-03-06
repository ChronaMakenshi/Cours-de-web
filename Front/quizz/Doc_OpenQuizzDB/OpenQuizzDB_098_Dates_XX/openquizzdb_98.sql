-- -----------------------------------------------------------------------------
--
-- OpenQuizzDB
-- Fournisseur de contenu libre
--
-- Quizz : Grandes dates du 20e siècle
-- Niveau de difficulté : 4
-- Rédacteur : Philippe Bresoux
--
-- http://www.openquizzdb.org
--
-- -----------------------------------------------------------------------------

--
-- Structure de la table `openquizzdb`
--

DROP TABLE IF EXISTS `openquizzdb`;
CREATE TABLE IF NOT EXISTS `openquizzdb` (
`quizz_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`theme` varchar(100) NOT NULL default '',
`question` varchar(255) NOT NULL default '',
`prop1` varchar(40) NOT NULL default '',
`prop2` varchar(40) NOT NULL default '',
`prop3` varchar(40) NOT NULL default '',
`prop4` varchar(40) NOT NULL default '',
`difficulte` varchar(9) NOT NULL default '',
`anecdote` varchar(255) NOT NULL default '',
`wiki` varchar(50) NOT NULL default '',
PRIMARY KEY (`quizz_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `openquizzdb`
--

INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En France, de quand datent les congés payés ainsi que la semaine de quarante heures ?', '1936', '1946', '1926', '1956', 'Débutant', 'Les congés payés sont une innovation sociale majeure dont certaines prémices étaient apparues en Allemagne.', 'Congés_payés');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quand a débuté la Cinquième République en France, succédant à la Quatrième République ?', '1958', '1968', '1948', '1938', 'Débutant', 'Elle marque une rupture par rapport à la tradition parlementaire de la République française.', 'Cinquième_République_(France)');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quelle est l\'année du début de la Seconde Guerre mondiale, conflit armé à l\'échelle planétaire ?', '1939', '1940', '1938', '1914', 'Débutant', 'Ce conflit planétaire opposa schématiquement deux camps : les Alliés et l\'Axe.', 'Seconde_Guerre_mondiale');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année a eu lieu la Bataille de Verdun du 21 février au 19 décembre ?', '1916', '1926', '1936', '1946', 'Débutant', 'Cette bataille a vu une moyenne de 70 000 victimes pour chacun des dix mois du conflit.', 'Bataille_de_Verdun_(1916)');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année a eu lieu la première Bataille de la Marne, mettant en échec le plan Schlieffen ?', '1914', '1916', '1940', '1942', 'Débutant', 'Cette bataille doit être distinguée de la seconde bataille de la Marne, qui se déroula en juillet 1918.', 'Bataille_de_la_Marne_(1914)');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année Kennedy, souvent désigné par ses initiales JFK, a-t-il été assassiné ?', '1963', '1973', '1953', '1983', 'Débutant', 'Son assassinat reste à ce jour, pour beaucoup, non résolu, alimentant les rumeurs et les hypothèses les plus folles.', 'John_Fitzgerald_Kennedy');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année est mort Charles de Gaulle, grand homme d’État français ?', '1970', '1960', '1980', '1950', 'Débutant', 'Charles de Gaulle est le premier à occuper la magistrature suprême sous la Cinquième République.', 'Charles_de_Gaulle');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année les Accords de Genève ont-ils marqué la fin de la guerre d\'Indochine ?', '1954', '1964', '1944', '1974', 'Débutant', 'Depuis 1946, la guerre d\'Indochine opposait principalement la France au Viet Minh dirigé par Ho Chi Minh.', 'Accords_de_Genève');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année Charles De Gaulle a-t-il été élu au suffrage universel ?', '1965', '1955', '1975', '1945', 'Débutant', 'Sa vision du pouvoir l\'oppose aux partis communiste, socialiste, centristes pro-européens et d\'extrême droite.', 'Charles_de_Gaulle');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année une crise économique mondiale sans précédent s\'est-elle déclenchée aux États-Unis ?', '1929', '1939', '1919', '1949', 'Débutant', 'La Grande Dépression va du krach de 1929 aux États-Unis jusqu\'à la Seconde Guerre mondiale.', 'Grande_Dépression');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année s\'est déroulée la Conférence de Brazzaville avec le général de Gaulle ?', '1944', '1954', '1964', '1974', 'Confirmé', 'À l\'issue de cette conférence, l\'abolition du code de l\'indigénat est décidée ainsi qu\'une politique d\'assimilation en faveur des colonies.', 'Conférence_de_Brazzaville');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année le Plan Marshall a-t-il permis de redresser l\'économie européenne ?', '1947', '1957', '1967', '1977', 'Confirmé', 'Les milliards débloqués ne furent pas un don mais un prêt accordé par des banques américaines.', 'Plan_Marshall');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Jusque quand Franco a-t-il gouverné l\'Espagne, avant l\'arrivée au pouvoir de Juan Carlos ?', '1975', '1985', '1965', '1995', 'Confirmé', 'Selon l\'historien franquiste Ricardo de la Cierva, il s\'agissait pour Franco de sauver l\'Espagne du chaos.', 'Francisco_Franco');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'La Guerre d\'Algérie a pris fin avec les Accords d\'Évian qui furent signés en quelle année ?', '1962', '1952', '1972', '1982', 'Confirmé', 'Après l\'indépendance, ce fut le tour d\'une guerre civile algérienne qui se termina en septembre 1963.', 'Accords_d\'Évian');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année fut signé à Rome le traité sur le fonctionnement de l\'Union européenne ?', '1957', '1967', '1947', '1977', 'Confirmé', 'Le Traité de Maastricht a renommé la Communauté économique européenne en Communauté européenne.', 'Traité_sur_le_fonctionnement_de_l\'Union_européenne');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En France, de quand date la victoire du Front Populaire, coalition de partis de gauche ?', '1936', '1926', '1946', '1956', 'Confirmé', 'Il réunissait les trois principaux partis de la gauche, la SFIO, le Parti radical-socialiste et le Parti communiste.', 'Front_populaire_(France)');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quelle est l\'année du torpillage du paquebot Lusitania et des premières attaques au gaz ?', '1915', '1905', '1925', '1935', 'Confirmé', 'Son torpillage, avec plus de 1 200 passagers, joua un rôle important dans l\'hostilité des États-Unis envers l\'Allemagne.', 'RMS_Lusitania');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année la France est-elle entrée dans la CEE pour mener une intégration économique ?', '1957', '1947', '1967', '1977', 'Confirmé', 'Charles de Gaulle utilisa son droit de veto à l\'entrée du Royaume-Uni dans les communautés.', 'Communauté_économique_européenne');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année Salvador Allende a-t-il trouvé la mort durant le coup d’État du général Pinochet ?', '1973', '1963', '1953', '1943', 'Confirmé', 'Salvador Allende se suicida dans le palais de la Moneda, sous les bombes putschistes.', 'Salvador_Allende');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'A partir de quelle année Fidel Catro a-t-il dirigé Cuba en renversant le régime de Batista ?', '1958', '1948', '1968', '1978', 'Confirmé', 'Ses détracteurs et des organisations de défense des droits de l\'Homme dénoncent son gouvernement comme une dictature.', 'Fidel_Castro');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quelle est l\'année de la nomination d\'Hitler comme chancelier du Reich ?', '1933', '1923', '1943', '1913', 'Expert', 'L\'année suivante, il se fait aussitôt plébisciter en août 1934 comme chef de l\'État, portant le titre de Führer.', 'Adolf_Hitler');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année le Japon a-t-il battu l\'Empire russe durant la bataille de Tsushima ?', '1905', '1915', '1925', '1935', 'Expert', 'Il s\'agit du principal affrontement naval de la guerre russo-japonaise (février 1904 - septembre 1905).', 'Bataille_de_Tsushima');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année la visite de Nixon à Pékin a-t-elle marqué la fin de l\'isolement diplomatique chinois ?', '1972', '1962', '1952', '1982', 'Expert', 'Cette visite est devenue une métaphore en anglais pour parler d\'une action inhabituelle d\'un politicien.', 'Visite_de_Richard_Nixon_en_Chine_en_1972');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année l\'Irlande du Sud, anciennement britannique, est-il devenu indépendant ?', '1921', '1911', '1901', '1931', 'Expert', 'Le Parlement de l\'Irlande du Sud de l\'Irlande ne s\'est réuni qu\'une seule fois avec seulement quatre membres présents.', 'Irlande_du_Sud');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année a eu lieu la Conférence de Bandung sur la décolonisation ?', '1955', '1965', '1945', '1975', 'Expert', 'La conférence à réuni pour la première fois les représentants de vingt-neuf pays africains et asiatiques.', 'Conférence_de_Bandung');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quelle est l\'année de l\'abdication de Guillaume II et de l\'exécution du tsar Nicolas II ?', '1918', '1928', '1938', '1908', 'Expert', 'Sans descendance, Guillaume II eut pour héritier son lointain cousin catholique Albert de Wurtemberg.', 'Guillaume_II_de_Wurtemberg');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quelle est l\'année du putsch manqué d\'Hitler et de la faillite de l\'économie allemande ?', '1923', '1933', '1943', '1913', 'Expert', 'Le putsch de Munich se déroula principalement à la Bürgerbräukeller, une brasserie de Munich.', 'Putsch_de_la_Brasserie');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'En quelle année les Britanniques ont-ils quitté l\'Inde, ancienne colonie d\'Asie ?', '1947', '1957', '1937', '1967', 'Expert', 'L\'Inde devient indépendante en 1947 après une lutte marquée par la résistance non-violente du Mahatma Gandhi.', 'Inde');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'La République Populaire de Chine fut proclamée en quelle année ?', '1949', '1939', '1929', '1919', 'Expert', 'Avec plus de 1,3 milliard d\'habitants, la Chine est le pays le plus peuplé du monde.', 'Chine');
INSERT INTO `openquizzdb` VALUES (null, 'Grandes dates du 20e siècle', 'Quand Churchill a-t-il déclaré : « Nous sommes en face d\'une catastrophe de première grandeur » ?', '1938', '1948', '1958', '1968', 'Expert', 'Les accords de Munich sont considérés comme ayant mis un terme à la première République tchécoslovaque.', 'Accords_de_Munich');