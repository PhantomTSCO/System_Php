-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2022 a las 12:21:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `employee`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_Pay` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `Da1` VARCHAR(10), `Da2` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH,Hours,Multi int DEFAULT -1;
SET Result=-100;
SELECT DATEDIFF(Da1,Da2) INTO Difference; 
If (Difference<=0)THEN
	IF EXISTS(SELECT * FROM Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E)) THEN
    	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
        SELECT Sum(Worked_Hours) INTO Hours FROM Employee_Worked_Hours WHERE EMployee_ID=IDH AND Worked_Date BETWEEN CAST(Da1 AS DATE) AND CAST(Da2 AS DATE);
        SET Difference=IFNull(Hours,-1);
        If(Difference<0) THEN
        	SET Result=-3;
        ELSE
        	SELECT Job_ID INTO Multi FROM Employee WHERE ID_E=IDH;
            SELECT Salary INTO IDH FROM Jobs WHERE ID_J=Multi;
            SET Multi=(Hours*IDH);
        	SET Result=Multi;
        END IF;
    ELSE
        SET Result=-2;
    END IF;
ELSE
	SET Result=-1;
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_Pay2` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `Da1` VARCHAR(10), `Da2` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH,Hours,Multi int DEFAULT -1;
SET Result=-100;
SELECT DATEDIFF(Da1,Da2) INTO Difference; 
If (Difference<=0)THEN
	IF EXISTS(SELECT * FROM Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E)) THEN
    	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
        SELECT Sum(Worked_Hours) INTO Hours FROM Employee_Worked_Hours WHERE EMployee_ID=IDH AND Worked_Date BETWEEN CAST(Da1 AS DATE) AND CAST(Da2 AS DATE);
        SET Difference=IFNull(Hours,-1);
        If(Difference<0) THEN
        	Insert into Results(Result) Values(-3);
        ELSE
        	SELECT Job_ID INTO Multi FROM Employee WHERE ID_E=IDH;
            SELECT Salary INTO IDH FROM Jobs WHERE ID_J=Multi;
            SET Multi=(Hours*IDH);
        	SET Result=Multi;
            Insert into Results(Result) Values(Result);
        END IF;
    ELSE
        Insert into Results(Result) Values(-2);
    END IF;
ELSE
	Insert into Results(Result) Values(-1);
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_Times` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `WH` INT, `WD` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH int DEFAULT -1;
SELECT DATEDIFF(CURDATE(),WD) INTO Difference;
If (Difference>=0)THEN
	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
	IF EXISTS(SELECT * FROM Employee_Worked_Hours Where (Worked_Date=WD AND Employee_ID=IDH)) THEN
    	SET Result=-2;
    ELSE
    	INSERT INTO Employee_Worked_Hours(Employee_ID,Worked_Hours,Worked_Date)
        VALUES(IDH,WH,WD);
        SET Result=1;
    END IF;
ELSE
	SET Result=-1;
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_Times2` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `WH` INT, `WD` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH int DEFAULT -1;
SELECT DATEDIFF(CURDATE(),WD) INTO Difference;
If (Difference>=0)THEN
	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
	IF EXISTS(SELECT * FROM Employee_Worked_Hours Where (Worked_Date=WD AND Employee_ID=IDH)) THEN
    	Insert into Results(Result) Values(-2);
    ELSE
    	INSERT INTO Employee_Worked_Hours(Employee_ID,Worked_Hours,Worked_Date)
        VALUES(IDH,WH,WD);
        Insert into Results(Result) Values(1);
    END IF;
ELSE
	Insert into Results(Result) Values(-1);
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_WH` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `Da1` VARCHAR(10), `Da2` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH,Hours int DEFAULT -1;
SET Result=-100;
SELECT DATEDIFF(Da1,Da2) INTO Difference; 
If (Difference<=0)THEN
	IF EXISTS(SELECT * FROM Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E)) THEN
    	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
        SELECT Sum(Worked_Hours) INTO Hours FROM Employee_Worked_Hours WHERE EMployee_ID=IDH AND Worked_Date BETWEEN CAST(Da1 AS DATE) AND CAST(Da2 AS DATE);
        SET Difference=IFNull(Hours,-1);
        If(Difference<0) THEN
        	SET Result=-3;
        ELSE
        	SET Result=Hours;
        END IF;
    ELSE
        SET Result=-2;
    END IF;
ELSE
	SET Result=-1;
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Add_WH2` (IN `Name_Em` VARCHAR(255), `Last_E` VARCHAR(255), `Da1` VARCHAR(10), `Da2` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference,IDH,Hours int DEFAULT -1;
SET Result=-100;
SELECT DATEDIFF(Da1,Da2) INTO Difference; 
If (Difference<=0)THEN
	IF EXISTS(SELECT * FROM Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E)) THEN
    	SELECT ID_E INTO IDH From Employee Where (Name_E=Name_Em AND Last_Name_E=Last_E);
        SELECT Sum(Worked_Hours) INTO Hours FROM Employee_Worked_Hours WHERE EMployee_ID=IDH AND Worked_Date BETWEEN CAST(Da1 AS DATE) AND CAST(Da2 AS DATE);
        SET Difference=IFNull(Hours,-1);
        If(Difference<0) THEN
        	Insert into Results(Result) Values(-3);
        ELSE
        	SET Result=Hours;
            Insert into Results(Result) Values(Result);
        END IF;
    ELSE
        Insert into Results(Result) Values(-2);
    END IF;
ELSE
	Insert into Results(Result) Values(-1);
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Last_Re` ()   BEGIN
select *
  from Results
 order by ID_R desc
 limit 1;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Look_Job` (IN `job` VARCHAR(255), OUT `Result` INT)   BEGIN
If EXISTS(Select*FROM jobs WHERE Name_J=job)THEN
SELECT * FROM Employee WHERE Job_ID=(SELECT ID_J from Jobs WHERE Name_J=job);
SET Result=1;
ELSE
SET Result=-1;
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Look_Job2` (IN `job` VARCHAR(255), OUT `Result` INT)   BEGIN
If EXISTS(Select*FROM jobs WHERE Name_J=job)THEN
Insert into Results(Result) Values(1);
SELECT * FROM Employee WHERE Job_ID=(SELECT ID_J from Jobs WHERE Name_J=job);

ELSE
Insert into Results(Result) Values(-1);
End IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_New_E` (IN `NA_E` VARCHAR(255), `La_E` VARCHAR(255), `J_E` VARCHAR(255), `G_E` VARCHAR(255), `Age` INT, `Bi_E` VARCHAR(10), OUT `Result` INT)   BEGIN
If EXISTS(Select*FROM Employee WHERE (Name_E=Na_E AND Last_Name_E=La_E))THEN
	SET Result=0;
ELSEIF EXISTS((SELECT * FROM Genders Where Name_G=G_E) )THEN
	IF EXISTS(SELECT * FROM Jobs Where Name_J=J_E) THEN
        IF(Age>=18)THEN
            INSERT INTO Employee(Name_E,Last_Name_E,Job_ID,Gender_ID,BirthDate) 
            VALUES(NA_E,La_E,(SELECT ID_J FROM Jobs Where NAME_J=J_E),(SELECT ID_G FROM Genders Where 		Name_G=G_E),Bi_E);
            SET Result=1;
        ELSEIF(Age<18)THEN
            SET Result=-1;
        END IF;
    ELSE
    	SET Result=-2;
    END IF;
ELSE
	SET Result=-3;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_New_E2` (IN `NA_E` VARCHAR(255), `La_E` VARCHAR(255), `J_E` VARCHAR(255), `G_E` VARCHAR(255), `Age` INT, `Bi_E` VARCHAR(10), OUT `Result` INT)   BEGIN
If EXISTS(Select*FROM Employee WHERE (Name_E=Na_E AND Last_Name_E=La_E))THEN
	Insert into Results(Result) Values(0);
ELSEIF EXISTS((SELECT * FROM Genders Where Name_G=G_E) )THEN
	IF EXISTS(SELECT * FROM Jobs Where Name_J=J_E) THEN
        IF(Age>=18)THEN
            INSERT INTO Employee(Name_E,Last_Name_E,Job_ID,Gender_ID,BirthDate) 
            VALUES(NA_E,La_E,(SELECT ID_J FROM Jobs Where NAME_J=J_E),(SELECT ID_G FROM Genders Where 		Name_G=G_E),Bi_E);
            Insert into Results(Result) Values(1);
        ELSEIF(Age<18)THEN
            Insert into Results(Result) Values(-1);
        END IF;
    ELSE
    	Insert into Results(Result) Values(-2);
    END IF;
ELSE
	Insert into Results(Result) Values(-3);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Test` (`WD` VARCHAR(10), OUT `Result` INT)   BEGIN
DECLARE Difference int DEFAULT -1;
SELECT DATEDIFF(CURDATE(),WD) INTO Difference;
SET Result=Difference;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `ID_E` int(11) NOT NULL,
  `Gender_ID` int(11) NOT NULL,
  `Job_ID` int(11) NOT NULL,
  `Name_E` varchar(255) NOT NULL,
  `Last_Name_E` varchar(255) NOT NULL,
  `BirthDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`ID_E`, `Gender_ID`, `Job_ID`, `Name_E`, `Last_Name_E`, `BirthDate`) VALUES
(1, 1, 1, 'John', 'Doe', '1995-11-11'),
(2, 2, 1, 'Jane', 'Doe', '1993-11-07'),
(3, 1, 1, 'Steven', 'Smith', '1980-03-11'),
(4, 3, 3, 'Marcus', 'Fenix', '1990-02-15'),
(5, 1, 2, 'Harry', 'Poster', '1992-04-22'),
(6, 2, 2, 'Stephanie', 'Dola', '2004-08-17'),
(7, 2, 2, 'Sara', 'Smith', '2000-02-12'),
(8, 2, 3, 'Clara', 'Sinclair', '2000-03-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee_worked_hours`
--

CREATE TABLE `employee_worked_hours` (
  `ID_WH` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Worked_Hours` int(11) NOT NULL,
  `Worked_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee_worked_hours`
--

INSERT INTO `employee_worked_hours` (`ID_WH`, `Employee_ID`, `Worked_Hours`, `Worked_Date`) VALUES
(1, 1, 5, '2022-11-20'),
(2, 2, 5, '2022-11-20'),
(3, 3, 4, '2022-11-20'),
(4, 4, 3, '2022-11-20'),
(5, 5, 7, '2022-11-20'),
(6, 1, 6, '2022-08-20'),
(8, 1, 6, '2022-09-14'),
(9, 1, 6, '2022-06-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genders`
--

CREATE TABLE `genders` (
  `ID_G` int(11) NOT NULL,
  `Name_G` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genders`
--

INSERT INTO `genders` (`ID_G`, `Name_G`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'No Binario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `ID_J` int(11) NOT NULL,
  `Name_J` varchar(255) NOT NULL,
  `Salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jobs`
--

INSERT INTO `jobs` (`ID_J`, `Name_J`, `Salary`) VALUES
(1, 'Conserje', 80),
(2, 'Gerente', 240),
(3, 'Vendedor', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `results`
--

CREATE TABLE `results` (
  `ID_R` int(11) NOT NULL,
  `Result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `results`
--

INSERT INTO `results` (`ID_R`, `Result`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 0),
(5, -1),
(6, -1),
(7, 0),
(8, 0),
(9, 0),
(10, -1),
(11, -2),
(12, -3),
(13, 0),
(14, -1),
(15, -2),
(16, -3),
(17, 1),
(18, 0),
(19, -1),
(20, -2),
(21, 1),
(22, -2),
(23, 1),
(24, -1),
(25, -1),
(26, -2),
(27, -2),
(28, -3),
(29, 23),
(30, -1),
(31, -1),
(32, -1),
(33, -1),
(34, -2),
(35, 18),
(36, -1),
(37, -2),
(38, -3),
(39, 1840),
(40, -1),
(41, -2),
(42, -3),
(43, 18),
(44, 18),
(45, -1),
(46, -1),
(47, -2),
(48, 1440),
(49, 1840),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, -2),
(56, 1),
(57, 1),
(58, -1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, -1),
(64, -1),
(65, 1),
(66, -1),
(67, 1),
(68, -1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID_E`),
  ADD KEY `FK_EG` (`Gender_ID`),
  ADD KEY `FK_EJ` (`Job_ID`);

--
-- Indices de la tabla `employee_worked_hours`
--
ALTER TABLE `employee_worked_hours`
  ADD PRIMARY KEY (`ID_WH`),
  ADD KEY `FK_EE` (`Employee_ID`);

--
-- Indices de la tabla `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`ID_G`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`ID_J`);

--
-- Indices de la tabla `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`ID_R`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `ID_E` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `employee_worked_hours`
--
ALTER TABLE `employee_worked_hours`
  MODIFY `ID_WH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `genders`
--
ALTER TABLE `genders`
  MODIFY `ID_G` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `ID_J` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `results`
--
ALTER TABLE `results`
  MODIFY `ID_R` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_EG` FOREIGN KEY (`Gender_ID`) REFERENCES `genders` (`ID_G`),
  ADD CONSTRAINT `FK_EJ` FOREIGN KEY (`Job_ID`) REFERENCES `jobs` (`ID_J`);

--
-- Filtros para la tabla `employee_worked_hours`
--
ALTER TABLE `employee_worked_hours`
  ADD CONSTRAINT `FK_EE` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID_E`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
