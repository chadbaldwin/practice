------------------------------------------------------------------------------
-- Input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #rawdata; --SELECT * FROM #rawdata
    CREATE TABLE #rawdata (ID int IDENTITY, Val varchar(100) NOT NULL);

    DECLARE @UseSampleData bit = 1;

    IF (@UseSampleData = 0)
    BEGIN;
        RAISERROR('Sample data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('2-4,6-8'),('2-3,4-5'),('5-7,7-9'),('2-8,3-7'),('6-6,4-6'),('2-6,4-8');
    END;
    ELSE
    BEGIN;
        RAISERROR('Real data',0,1) WITH NOWAIT;
        INSERT INTO #rawdata (Val) VALUES
            ('98-99,3-97'),('23-72,23-72'),('53-62,8-87'),('21-52,36-51'),('36-38,37-96'),('92-96,4-92'),('7-30,8-60'),('31-44,43-88'),('67-73,45-73'),('37-48,49-62'),('32-50,1-33'),('39-98,38-47'),('11-17,18-88'),('35-99,36-97'),('9-82,2-3'),('27-50,4-10'),('1-92,5-92'),('6-40,4-40'),('4-7,2-3'),('98-99,46-96'),('24-38,23-39'),('5-88,5-87'),('12-97,12-96'),('19-37,18-37'),('14-39,14-85'),('25-55,24-45'),('30-92,31-92'),('49-61,50-79'),('4-69,4-70'),('29-37,29-42'),('12-77,11-79'),('2-2,4-86'),('55-55,54-54'),('55-80,81-86'),('8-10,7-8'),('52-92,42-54'),('32-63,32-55'),('3-83,2-83'),('97-97,8-97'),('13-87,86-90'),('43-95,42-43'),('39-96,39-84'),('81-96,36-80'),('80-84,51-79'),('37-43,14-43'),('46-69,45-57'),('14-85,5-13'),('69-77,70-78'),('18-77,14-14'),('45-92,22-44'),('53-68,53-77'),('5-98,5-7'),('45-68,45-68'),('7-89,25-88'),('24-89,24-25'),('50-68,49-67'),('57-57,58-79'),('21-98,97-99'),('29-60,14-23'),('74-97,2-98'),('56-69,69-85'),('33-48,6-94'),('99-99,22-97'),('7-97,6-95'),('14-20,14-35'),('10-75,10-50'),('2-3,4-15'),('51-77,55-77'),('81-94,82-95'),('39-40,39-58'),('20-70,19-69'),('40-73,39-39'),('90-90,21-90'),('12-75,10-76'),('4-25,1-24'),('1-72,3-71'),('31-84,85-85'),('61-71,27-61'),('25-90,24-89'),('73-86,73-93'),('37-84,25-35'),('96-97,82-97'),('2-3,5-87'),('58-59,37-59'),('97-99,31-97'),('40-50,39-41'),('5-98,6-99'),('1-93,93-95'),('44-87,43-86'),('26-26,27-74'),('19-87,1-18'),('18-49,16-16'),('36-56,56-82'),('54-56,55-60'),('56-67,66-68'),('70-98,27-39'),('55-56,2-55'),('29-29,30-42'),('44-83,46-83'),('43-98,73-97'),
            ('59-63,59-92'),('47-47,24-47'),('64-84,64-70'),('60-72,61-72'),('8-26,9-67'),('12-41,41-41'),('9-50,51-51'),('81-87,86-92'),('75-98,97-98'),('66-80,7-80'),('7-91,8-82'),('97-97,2-96'),('20-62,21-97'),('19-20,20-90'),('85-97,85-99'),('6-87,2-33'),('23-59,23-48'),('49-82,48-64'),('55-69,54-77'),('43-44,43-92'),('90-98,10-89'),('96-96,10-96'),('5-93,2-93'),('49-83,48-49'),('66-93,58-58'),('11-71,10-10'),('49-95,73-95'),('43-81,43-80'),('15-50,15-50'),('24-52,51-53'),('57-87,57-86'),('16-73,73-82'),('51-98,52-88'),('3-39,39-50'),('23-23,24-80'),('88-88,44-87'),('9-97,95-97'),('7-52,51-53'),('6-7,6-98'),('42-96,41-95'),('91-94,4-92'),('30-31,31-96'),('76-86,75-77'),('7-98,6-99'),('15-97,14-82'),('65-76,66-70'),('14-15,15-62'),('2-88,2-98'),('6-89,5-88'),('7-79,79-79'),('25-50,25-59'),('90-95,56-95'),('10-13,14-49'),('18-29,30-90'),('32-64,64-64'),('10-41,11-28'),('34-88,35-35'),('1-54,6-53'),('23-97,97-97'),('6-20,3-5'),('17-82,16-17'),('35-52,71-92'),('34-47,25-35'),('30-84,31-83'),('11-87,11-60'),('3-20,3-19'),('21-25,26-99'),('8-12,10-10'),('4-91,93-97'),('16-96,10-16'),('5-24,4-6'),('8-49,8-87'),('9-94,8-93'),('1-3,2-66'),('5-19,6-25'),('8-25,7-25'),('2-2,4-92'),('30-62,61-87'),('37-61,38-61'),('62-96,50-96'),('16-41,15-41'),('78-79,80-95'),('4-94,5-94'),('52-99,9-51'),('32-59,81-83'),('81-86,82-86'),('21-23,21-24'),('88-88,18-88'),('75-88,35-76'),('20-68,18-18'),('4-46,5-46'),('54-82,53-92'),('13-64,65-65'),('5-7,8-67'),('1-4,4-88'),('51-63,18-52'),('19-94,36-94'),('56-77,56-57'),('3-25,55-92'),('58-68,57-67'),
            ('35-89,35-99'),('84-92,83-84'),('18-18,19-96'),('85-89,87-89'),('19-81,18-95'),('7-98,6-99'),('9-11,10-69'),('4-89,4-5'),('25-93,58-74'),('35-67,67-99'),('17-62,17-62'),('10-18,19-90'),('66-86,84-85'),('2-46,46-46'),('16-41,41-73'),('22-92,11-21'),('9-60,6-61'),('71-71,56-71'),('57-58,27-58'),('4-92,2-91'),('85-85,85-85'),('44-66,23-26'),('2-18,3-92'),('1-96,30-96'),('61-80,60-78'),('37-87,36-38'),('32-77,27-31'),('1-67,68-79'),('98-99,7-65'),('29-49,30-77'),('56-73,57-72'),('63-65,64-94'),('34-86,81-87'),('7-92,7-8'),('3-98,3-97'),('66-81,60-65'),('85-85,1-85'),('16-98,17-40'),('13-95,12-95'),('18-27,7-28'),('26-35,34-77'),('27-52,27-51'),('23-71,22-72'),('12-41,37-40'),('69-87,69-92'),('29-31,30-41'),('62-73,61-74'),('23-77,23-27'),('52-57,51-52'),('12-20,11-18'),('61-61,4-60'),('1-98,2-45'),('6-98,6-90'),('11-14,11-17'),('28-53,22-52'),('43-59,67-75'),('45-47,46-63'),('75-75,44-75'),('48-50,51-52'),('19-82,7-18'),('8-41,14-49'),('53-54,53-55'),('11-97,97-97'),('56-87,30-30'),('14-96,15-46'),('38-41,20-42'),('17-23,23-62'),('2-85,4-86'),('8-69,6-6'),('14-73,13-72'),('21-62,8-69'),('87-98,88-96'),('17-60,61-61'),('10-65,65-65'),('2-11,13-93'),('10-13,14-99'),('10-66,79-83'),('51-87,2-50'),('7-86,8-73'),('53-53,54-72'),('1-95,2-96'),('52-73,52-74'),('59-72,72-74'),('43-73,74-88'),('8-90,8-9'),('11-81,80-94'),('59-84,85-85'),('90-94,4-89'),('36-82,36-83'),('7-87,96-97'),('30-99,36-99'),('57-57,30-57'),('16-98,4-98'),('45-53,44-81'),('83-83,69-83'),('8-89,90-90'),('14-46,4-47'),('80-82,15-81'),('50-57,58-94'),('18-98,1-18'),
            ('17-36,35-79'),('4-5,6-95'),('14-95,15-98'),('59-59,60-75'),('5-82,6-37'),('10-11,10-74'),('19-70,19-69'),('78-95,77-85'),('59-86,58-58'),('72-73,72-80'),('53-81,82-91'),('79-97,80-95'),('9-83,10-88'),('67-76,67-68'),('19-43,30-32'),('84-97,7-83'),('8-10,9-77'),('73-74,49-74'),('2-59,6-60'),('1-6,6-98'),('20-92,12-20'),('68-69,68-74'),('98-99,99-99'),('14-15,15-80'),('23-60,23-98'),('5-6,5-14'),('38-42,37-55'),('4-13,5-14'),('2-5,3-5'),('4-35,3-88'),('20-94,94-94'),('11-89,10-32'),('11-47,22-47'),('95-99,26-85'),('7-58,6-6'),('4-6,5-99'),('4-95,4-96'),('96-97,1-95'),('1-4,1-84'),('35-95,34-91'),('9-15,18-34'),('46-65,66-87'),('38-81,38-71'),('9-10,9-90'),('66-99,1-99'),('4-71,60-69'),('20-43,20-42'),('5-59,1-4'),('91-99,22-75'),('87-96,62-87'),('22-37,21-36'),('16-55,85-99'),('33-99,33-55'),('57-98,58-79'),('39-97,96-96'),('73-99,72-89'),('14-74,15-15'),('10-33,10-11'),('8-13,12-23'),('1-99,2-99'),('83-83,12-83'),('3-19,19-29'),('33-50,34-78'),('14-16,16-68'),('65-84,64-98'),('43-75,75-98'),('26-77,8-25'),('5-14,15-97'),('15-15,16-16'),('15-61,14-15'),('5-19,18-23'),('7-88,8-99'),('37-37,33-37'),('71-84,18-74'),('5-91,95-96'),('92-96,9-90'),('75-92,3-92'),('3-95,3-96'),('75-76,68-76'),('78-91,16-90'),('28-65,27-72'),('40-98,34-98'),('18-42,19-43'),('32-83,83-96'),('20-93,20-92'),('32-34,31-33'),('72-95,43-72'),('15-91,14-92'),('15-82,15-89'),('6-94,6-96'),('4-76,76-93'),('3-91,4-90'),('47-72,71-72'),('7-52,8-45'),('97-98,14-98'),('3-98,6-99'),('2-91,3-49'),('11-75,13-74'),('35-79,36-70'),('24-79,23-79'),
            ('64-99,63-63'),('21-25,27-94'),('3-83,2-99'),('8-64,33-65'),('44-44,23-44'),('87-98,64-86'),('76-76,9-75'),('8-64,7-40'),('76-82,75-98'),('1-98,6-69'),('67-79,66-79'),('59-61,13-59'),('12-93,43-94'),('7-87,82-88'),('8-68,8-85'),('16-53,7-16'),('30-97,30-97'),('21-85,22-86'),('51-93,44-95'),('4-68,2-86'),('5-19,9-19'),('65-97,99-99'),('8-63,27-62'),('46-53,45-50'),('7-19,20-40'),('37-77,9-36'),('99-99,54-97'),('1-99,1-99'),('28-57,28-58'),('1-11,3-11'),('27-33,28-38'),('9-99,10-97'),('41-41,41-46'),('5-83,14-70'),('16-91,90-99'),('15-96,96-96'),('2-77,1-98'),('18-47,17-94'),('7-26,7-27'),('14-41,15-41'),('5-26,6-79'),('44-56,45-81'),('79-93,80-99'),('17-66,35-65'),('87-97,39-82'),('10-71,6-71'),('68-95,51-62'),('23-96,26-74'),('70-82,69-71'),('41-99,41-71'),('23-72,22-71'),('52-82,48-52'),('81-86,86-86'),('18-75,74-76'),('26-37,32-37'),('5-95,1-97'),('43-43,42-64'),('20-91,21-60'),('35-50,35-66'),('76-93,13-76'),('32-70,32-71'),('12-85,13-82'),('1-74,5-73'),('17-69,16-17'),('51-83,51-82'),('9-97,7-9'),('1-98,1-2'),('42-77,28-99'),('20-67,20-22'),('33-45,33-44'),('24-24,25-90'),('97-99,6-93'),('12-98,11-72'),('4-17,5-96'),('96-97,1-95'),('7-7,7-83'),('71-72,71-91'),('24-47,1-23'),('29-35,30-46'),('36-74,7-36'),('37-63,61-63'),('57-86,19-87'),('20-40,40-74'),('5-35,36-72'),('18-84,17-98'),('9-19,20-67'),('29-43,29-42'),('52-82,77-81'),('57-78,9-84'),('7-89,9-90'),('6-98,27-99'),('1-90,40-90'),('1-99,3-98'),('18-72,31-72'),('99-99,86-96'),('50-90,9-89'),('30-70,29-69'),('87-98,37-62'),('32-69,11-31'),('2-20,3-64'),
            ('1-43,1-47'),('16-93,17-93'),('28-50,49-51'),('48-97,17-47'),('64-80,65-66'),('7-98,85-99'),('7-39,8-92'),('26-82,26-27'),('43-93,43-52'),('26-79,27-94'),('14-31,13-31'),('22-72,21-23'),('31-77,12-77'),('18-77,78-94'),('1-99,2-99'),('13-22,14-53'),('12-79,11-40'),('61-84,26-60'),('6-40,17-41'),('34-79,35-80'),('79-82,78-79'),('8-19,20-93'),('6-77,7-56'),('30-95,26-26'),('29-70,30-92'),('1-8,7-55'),('42-59,43-79'),('25-89,24-26'),('57-67,56-67'),('16-39,50-51'),('46-73,20-71'),('33-56,57-71'),('59-60,61-66'),('7-20,8-20'),('70-94,16-34'),('6-8,3-6'),('4-99,3-94'),('3-60,3-51'),('96-96,65-98'),('3-81,3-80'),('60-73,89-90'),('29-77,28-30'),('5-25,22-63'),('6-43,1-42'),('86-90,1-61'),('3-74,6-75'),('36-84,37-83'),('27-64,69-73'),('80-84,1-83'),('22-68,68-69'),('52-53,52-76'),('85-92,9-84'),('6-48,7-48'),('42-74,41-42'),('4-77,5-90'),('23-63,11-18'),('26-27,26-26'),('24-93,24-92'),('13-56,13-56'),('2-3,2-2'),('35-95,99-99'),('19-21,20-22'),('34-98,34-96'),('4-88,3-5'),('9-75,8-74'),('70-98,71-83'),('62-69,61-61'),('3-5,5-7'),('4-62,13-61'),('17-23,33-72'),('95-95,9-95'),('31-52,31-32'),('62-98,98-99'),('67-88,19-67'),('23-30,36-76'),('91-95,95-95'),('25-86,24-60'),('24-24,25-40'),('44-91,44-45'),('47-83,20-46'),('81-92,40-80'),('10-60,9-83'),('81-99,38-80'),('86-86,85-85'),('17-92,44-92'),('14-16,13-73'),('13-38,12-14'),('5-42,6-46'),('29-79,28-78'),('29-68,58-76'),('33-54,50-54'),('50-70,70-70'),('5-95,3-4'),('20-38,21-37'),('2-31,3-21'),('37-54,33-53'),('61-93,74-94'),('16-81,6-81'),('6-42,41-42'),('45-61,45-60'),
            ('36-86,37-89'),('12-53,12-52'),('8-70,71-74'),('20-99,19-84'),('4-82,83-87'),('74-74,75-98'),('11-99,11-94'),('59-79,45-59'),('13-92,14-93'),('13-25,12-93'),('7-76,6-8'),('16-70,16-17'),('7-7,60-76'),('56-94,14-95'),('98-98,23-70'),('1-2,5-70'),('30-34,31-31'),('20-71,70-72'),('36-38,16-37'),('7-62,7-63'),('2-94,3-95'),('44-61,43-60'),('49-49,49-83'),('14-98,5-13'),('6-95,6-95'),('41-67,68-72'),('40-99,39-98'),('58-58,58-70'),('64-98,63-98'),('24-56,25-62'),('32-81,31-32'),('26-60,91-92'),('31-37,3-38'),('33-37,19-33'),('98-98,97-99'),('74-76,62-72'),('4-52,1-51'),('39-81,38-81'),('55-75,28-76'),('45-45,46-98'),('4-61,3-11'),('57-98,67-95'),('1-99,1-99'),('52-75,75-93'),('19-19,20-50'),('59-72,62-63'),('8-14,7-15'),('70-89,90-98'),('4-14,14-94'),('58-59,51-58'),('2-98,1-97'),('4-36,13-36'),('45-99,64-98'),('26-89,35-69'),('34-35,34-34'),('40-51,39-45'),('5-92,4-5'),('1-90,5-89'),('17-39,34-38'),('37-85,37-85'),('39-99,39-39'),('9-98,11-98'),('13-72,4-8'),('6-94,7-80'),('12-55,13-54'),('5-8,7-96'),('32-96,95-97'),('44-62,44-61'),('2-4,10-42'),('41-97,91-97'),('8-35,7-7'),('64-90,91-91'),('55-92,55-91'),('2-5,5-54'),('53-95,54-98'),('63-91,63-94'),('19-67,5-93'),('13-84,83-84'),('18-78,78-83'),('4-4,7-27'),('1-99,2-98'),('51-78,51-77'),('4-96,5-98'),('9-33,14-35'),('13-89,12-84'),('44-57,23-44'),('2-78,7-78'),('40-49,39-41'),('90-96,18-39'),('35-65,41-62'),('5-77,24-76'),('72-77,77-84'),('53-89,85-89'),('30-63,30-64'),('21-93,21-94'),('7-63,5-63'),('63-80,63-93'),('97-98,14-98'),('19-62,64-74'),('72-92,71-91'),
            ('29-31,30-76'),('47-82,83-83'),('38-39,39-76'),('4-87,11-88'),('7-96,6-80'),('36-61,33-37'),('50-96,95-97'),('11-81,12-92'),('14-74,74-74'),('79-92,7-80'),('24-25,25-90'),('12-78,12-79'),('47-99,7-98'),('51-60,51-85'),('49-70,50-70'),('8-17,20-92'),('1-11,12-65'),('41-72,72-72'),('41-56,40-64'),('10-63,11-11'),('70-84,36-85'),('2-4,3-99'),('84-84,85-88'),('19-86,21-85'),('7-55,55-55'),('6-71,1-70'),('15-15,15-87'),('24-82,10-14'),('65-80,54-64'),('50-89,49-98'),('4-4,10-11'),('56-99,56-99'),('32-78,2-31'),('6-78,7-89'),('8-71,90-95'),('3-94,38-93'),('25-77,85-92'),('83-88,82-89'),('34-91,33-90'),('51-93,2-93'),('2-63,2-80'),('4-96,24-96'),('37-62,37-62'),('24-38,39-55'),('11-98,11-99'),('5-58,4-47'),('71-96,33-98'),('22-35,33-35'),('40-63,39-46'),('18-18,19-69'),('12-95,12-44'),('47-69,68-70'),('72-74,5-72'),('2-48,31-47'),('4-40,41-79'),('13-83,13-32'),('47-50,6-46'),('20-52,20-49'),('49-76,23-37'),('9-92,9-92'),('9-69,10-88'),('16-68,15-67'),('2-64,9-57'),('85-85,16-81'),('60-60,61-89'),('9-69,69-87'),('30-86,31-96'),('21-50,50-96'),('96-96,31-77'),('91-98,20-91'),('18-84,9-85'),('11-27,18-18'),('35-44,35-66'),('2-85,84-90'),('58-95,99-99'),('22-22,21-91'),('30-90,30-91'),('15-15,17-94'),('7-97,97-99'),('4-42,3-43'),('26-96,7-24'),('11-84,8-99'),('94-95,15-94'),('66-71,70-71'),('29-54,54-54'),('89-89,3-89'),('74-76,75-77'),('14-32,33-86'),('35-78,79-79'),('17-88,87-98'),('20-52,19-59'),('1-1,19-94'),('44-89,43-94'),('43-43,26-42'),('7-45,6-32'),('5-46,5-48'),('98-98,10-57'),('27-86,22-28'),('34-92,33-33'),('38-74,2-73'),
            ('59-89,9-59'),('13-14,15-38'),('17-59,18-93'),('8-91,7-8'),('62-79,62-89'),('21-45,45-83'),('77-85,16-72'),('62-83,65-84'),('1-99,1-99'),('14-75,15-75'),('28-99,27-28'),('14-83,4-83'),('1-2,5-60'),('40-79,79-79'),('83-89,84-87'),('3-3,4-46'),('3-38,1-49'),('13-76,12-12'),('4-7,6-14'),('43-71,6-72'),('28-61,12-27'),('27-32,28-32'),('17-82,17-83'),('13-45,14-74'),('38-99,70-98'),('18-78,16-18'),('41-55,40-42'),('36-76,1-71'),('12-24,25-77'),('36-36,37-98'),('2-2,3-75'),('2-97,59-98'),('26-95,27-37'),('44-46,18-45'),('58-65,58-74'),('42-92,25-92'),('7-86,85-86'),('73-76,69-78'),('1-2,3-86'),('24-97,20-99'),('62-92,13-92'),('25-86,24-86'),('31-89,8-89'),('13-38,13-37'),('13-83,24-84'),('96-96,4-96'),('26-43,25-26'),('88-90,75-89'),('54-59,2-60'),('13-79,3-78'),('43-58,42-90'),('49-53,11-55'),('89-91,11-90'),('18-78,79-91'),('35-99,36-98'),('36-82,96-97'),('32-68,36-69'),('12-98,12-96'),('23-49,41-49'),('1-83,2-89'),('30-36,30-37'),('14-85,13-84'),('38-40,9-39'),('8-86,7-87'),('2-80,36-54'),('2-68,69-69'),('23-49,23-57'),('13-77,78-91'),('71-99,99-99'),('2-33,44-80'),('48-50,4-49'),('17-88,17-87'),('62-83,61-94'),('35-73,34-72'),('15-93,93-93'),('8-40,8-77'),('21-21,22-84'),('7-52,6-8'),('6-97,7-99'),('38-46,38-38'),('85-86,4-86'),('40-69,69-94'),('1-99,41-98'),('3-31,2-93'),('44-47,29-65'),('42-42,41-65'),('48-74,74-82'),('62-83,1-61'),('9-17,10-18'),('36-43,44-66'),('8-95,37-95'),('5-33,13-32'),('19-95,94-95'),('64-65,65-69'),('16-66,67-67'),('52-61,45-61'),('50-73,51-74'),('3-80,5-80'),('90-99,68-89'),('3-97,2-99'),
            ('18-27,18-27'),('45-46,28-46'),('15-54,16-54'),('14-76,13-75'),('97-99,1-97'),('36-78,35-78'),('40-67,65-67'),('18-76,6-99'),('94-96,95-95'),('95-96,22-84'),('2-20,19-82'),('34-83,33-82'),('56-61,56-57'),('79-87,78-81'),('8-57,7-56'),('83-86,83-85'),('6-91,90-97'),('76-86,28-87'),('95-96,9-94'),('19-32,33-42'),('23-30,28-32'),('17-81,17-81'),('53-71,72-82'),('70-72,71-86'),('34-65,35-64'),('12-87,86-87'),('63-68,62-67'),('10-38,9-39'),('18-70,18-71'),('5-6,7-83'),('59-96,59-95'),('33-73,21-32'),('16-65,17-65'),('24-62,16-16'),('4-86,3-85'),('5-95,6-94'),('15-46,16-94'),('3-87,9-86'),('17-56,7-55'),('22-23,22-62'),('48-89,47-90'),('25-26,26-86'),('64-71,63-64'),('91-98,7-91'),('10-10,11-16'),('25-58,25-59'),('8-64,46-64'),('24-71,25-72'),('65-65,14-65'),('19-59,19-19'),('42-74,42-43'),('7-79,8-90'),('47-70,16-71'),('43-57,42-56'),('40-41,41-82'),('15-59,15-58'),('15-84,5-16'),('1-31,18-30'),('4-59,5-86'),('78-83,74-82'),('55-56,55-96'),('69-88,8-68'),('23-32,43-83'),('2-75,5-96'),('52-97,53-96'),('5-80,19-68'),('6-99,5-5'),('16-86,2-17'),('15-34,11-33'),('15-69,15-69'),('5-57,6-56'),('4-95,5-96'),('41-54,24-54'),('27-27,28-39'),('4-28,3-5'),('50-80,58-79'),('80-90,80-96'),('5-98,1-5'),('71-84,71-83'),('95-96,63-94'),('21-96,20-97'),('75-76,62-76'),('30-59,53-99'),('53-93,53-66'),('21-97,15-99'),('12-80,8-86'),('5-21,22-40'),('4-76,4-75'),('17-19,22-91'),('1-8,7-54'),('9-57,5-9'),('5-84,84-87'),('56-56,55-85'),('55-57,56-72'),('25-32,36-58'),('58-95,59-96'),('7-35,49-54'),('3-95,96-97'),('40-43,40-70'),('14-90,13-89');
    END;
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Parse raw input data
------------------------------------------------------------------------------
    DROP TABLE IF EXISTS #data; --SELECT * FROM #data
    SELECT d.ID, d.Val
        , Start1 = CONVERT(int, PARSENAME(x.Val, 4))
        , End1   = CONVERT(int, PARSENAME(x.Val, 3))
        , Start2 = CONVERT(int, PARSENAME(x.Val, 2))
        , End2   = CONVERT(int, PARSENAME(x.Val, 1))
    INTO #data
    FROM #rawdata d
        CROSS APPLY (SELECT Val = REPLACE(REPLACE(d.Val,'-','.'),',','.')) x
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 1
------------------------------------------------------------------------------
    SELECT Answer = COUNT(*)
    FROM #data d
    WHERE  (d.Start1 <= d.Start2 AND d.End2 <= d.End1)
        OR (d.Start2 <= d.Start1 AND d.End1 <= d.End2)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Part 2
------------------------------------------------------------------------------
    SELECT Answer = COUNT(*)
    FROM #data d
    WHERE (d.Start1 <= d.End2) AND (d.End1 >= d.Start2)
------------------------------------------------------------------------------

------------------------------------------------------------------------------
