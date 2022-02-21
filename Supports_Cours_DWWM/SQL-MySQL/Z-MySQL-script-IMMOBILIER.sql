DROP TABLE appart CASCADE CONSTRAINTS;
DROP TABLE immeuble CASCADE CONSTRAINTS;

CREATE TABLE IF NOT EXISTS immeuble (
  noimm   CHAR(5) PRIMARY KEY,
  adresse CHAR(50) NOT NULL,
  ville   CHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS appart (
  noappart   INT PRIMARY KEY,
  noimm CHAR(5) NOT NULL,
  nbrepieces INT NOT NULL,
  prix  NUMERIC(8,0) NOT NULL,
  surface DECIMAL(4,2) NOT NULL
);
/

ALTER TABLE appart ADD CONSTRAINT FK_appart_immeuble FOREIGN KEY (noimm)
	REFERENCES immeuble (noimm) ON DELETE CASCADE;


INSERT INTO immeuble VALUES ('1','route de l''analyse', 'Caen'),
                            ('2','chemin de la raison', 'Rouen'),
                            ('2b','détour du code', 'Le Havre'),
                            ('3','impasse des exceptions', 'Le Havre'),
                            ('3b','rue des sources', 'Caen'),
                            ('4','bd des objets', 'Le Mans');

INSERT INTO appart VALUES (10, '1' , 3, 500, 25);
INSERT INTO appart VALUES (20, '1' , 2, 400, 25);
INSERT INTO appart VALUES (30, '2' , 2, 300, 20);
INSERT INTO appart VALUES (40, '2b', 4, 700, 50);
INSERT INTO appart VALUES (50, '3' , 4, 500, 50);
INSERT INTO appart VALUES (60, '3' , 2, 400, 40);
INSERT INTO appart VALUES (70, '3b', 4, 600, 60);
INSERT INTO appart VALUES (80, '4' , 2, 400, 25);

COMMIT;




