CREATE USER 'util1'@'%' IDENTIFIED BY 'Roger';

GRANT ALL PRIVILEGES ON papyrus.* TO 'util1'@'%'
IDENTIFIED BY 'Roger';

CREATE USER 'util2'@'%' IDENTIFIED BY 'Federer';

GRANT SELECT ON papyrus.* TO 'util2'@'%'
IDENTIFIED BY 'Federer';

CREATE USER 'util3'@'%' IDENTIFIED BY '21GM';

GRANT SHOW VIEW ON papyrus.fournis TO 'util3'@'%'
IDENTIFIED BY '21GM';