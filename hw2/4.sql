CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `name` varchar(30),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;

CREATE TABLE `owner` (
  `ID` int(11) NOT NULL,
  `name` varchar(30),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;

CREATE TABLE `location` (
  `address` varchar(120) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `zip_code` int(11),
  PRIMARY KEY (`address`,`city`,`state`)
) ENGINE=InnoDB;

CREATE TABLE `sales_office` (
  `office_num` int(11) NOT NULL,
  `manager_ID` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`office_num`),
  UNIQUE (manager_ID),
  UNIQUE (address, city, state),
  FOREIGN KEY (`manager_ID`) REFERENCES `employee` (`ID`),
  FOREIGN KEY (`address`, `city`, `state`) REFERENCES `location` (`address`, `city`, `state`)
) ENGINE=InnoDB; 

CREATE TABLE `property` (
  `ID` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE (address, city, state),
  FOREIGN KEY (`address`, `city`, `state`) REFERENCES `location` (`address`, `city`, `state`)
) ENGINE=InnoDB;

CREATE TABLE `own` (
  `o_ID` int(11) NOT NULL,
  `p_ID` int(11) NOT NULL,
  `percentage` int(11),
  PRIMARY KEY (`o_ID`,`p_ID`),
  FOREIGN KEY (`o_ID`) REFERENCES `owner` (`ID`),
  FOREIGN KEY (`p_ID`) REFERENCES `property` (`ID`)
) ENGINE=InnoDB;

CREATE TABLE `assign` (
  `e_ID` int(11) NOT NULL,
  `office_num` int(11) NOT NULL,
  PRIMARY KEY (`e_ID`),
  FOREIGN KEY (`e_ID`) REFERENCES `employee` (`ID`),
  FOREIGN KEY (`office_num`) REFERENCES `sales_office` (`office_num`)
) ENGINE=InnoDB;

CREATE TABLE `list` (
  `p_ID` int(11) NOT NULL,
  `office_num` int(11) NOT NULL,
  PRIMARY KEY (`p_ID`),
  FOREIGN KEY (`p_ID`) REFERENCES `property` (`ID`),
  FOREIGN KEY (`office_num`) REFERENCES `sales_office` (`office_num`)
) ENGINE=InnoDB;
