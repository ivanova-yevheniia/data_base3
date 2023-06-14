INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.ukrball100, zno.ukrball12, zno.ukrball,
       zno.ukrptname, zno.ukrptareaname, zno.ukrpttername
FROM zno
INNER JOIN test_subject ON zno.ukrtest=test_subject.name
INNER JOIN test_status ON zno.ukrteststatus=test_status.name
INNER JOIN location ON zno.ukrptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.histball100, zno.histball12, zno.histball,
       zno.histptname, zno.histptareaname, zno.histpttername
FROM zno
INNER JOIN test_subject ON zno.histtest=test_subject.name
INNER JOIN test_status ON zno.histteststatus=test_status.name
INNER JOIN location ON zno.histptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.mathball100, zno.mathball12, zno.mathball,
       zno.mathptname, zno.mathptareaname, zno.mathpttername
FROM zno
INNER JOIN test_subject ON zno.mathtest=test_subject.name
INNER JOIN test_status ON zno.mathteststatus=test_status.name
INNER JOIN location ON zno.mathptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.physball100, zno.physball12, zno.physball,
       zno.physptname, zno.physptareaname, zno.physpttername
FROM zno
INNER JOIN test_subject ON zno.phystest=test_subject.name
INNER JOIN test_status ON zno.physteststatus=test_status.name
INNER JOIN location ON zno.physptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.chemball100, zno.chemball12, zno.chemball,
       zno.chemptname, zno.chemptareaname, zno.chempttername
FROM zno
INNER JOIN test_subject ON zno.chemtest=test_subject.name
INNER JOIN test_status ON zno.chemteststatus=test_status.name
INNER JOIN location ON zno.chemptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.bioball100, zno.bioball12, zno.bioball,
       zno.bioptname, zno.bioptareaname, zno.biopttername
FROM zno
INNER JOIN test_subject ON zno.biotest=test_subject.name
INNER JOIN test_status ON zno.bioteststatus=test_status.name
INNER JOIN location ON zno.bioptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.geoball100, zno.geoball12, zno.geoball,
       zno.geoptname, zno.geoptareaname, zno.geopttername
FROM zno
INNER JOIN test_subject ON zno.geotest=test_subject.name
INNER JOIN test_status ON zno.geoteststatus=test_status.name
INNER JOIN location ON zno.geoptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.engball100, zno.engball12, zno.engball,
       zno.engptname, zno.engptareaname, zno.engpttername
FROM zno
INNER JOIN test_subject ON zno.engtest=test_subject.name
INNER JOIN test_status ON zno.engteststatus=test_status.name
INNER JOIN location ON zno.engptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.fraball100, zno.fraball12, zno.fraball,
       zno.fraptname, zno.fraptareaname, zno.frapttername
FROM zno
INNER JOIN test_subject ON zno.fratest=test_subject.name
INNER JOIN test_status ON zno.frateststatus=test_status.name
INNER JOIN location ON zno.fraptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.deuball100, zno.deuball12, zno.deuball,
       zno.deuptname, zno.deuptareaname, zno.deupttername
FROM zno
INNER JOIN test_subject ON zno.deutest=test_subject.name
INNER JOIN test_status ON zno.deuteststatus=test_status.name
INNER JOIN location ON zno.deuptregname=location.name;


INSERT INTO test (outid, year, subject_id, status_id, location_id, 
                 ball100, ball12, ball, 
                 ptname, ptareaname, pttername)
SELECT zno.outid, zno.znoyear, test_subject.id, test_status.id, location.id,
       zno.spaball100, zno.spaball12, zno.spaball,
       zno.spaptname, zno.spaptareaname, zno.spapttername
FROM zno
INNER JOIN test_subject ON zno.spatest=test_subject.name
INNER JOIN test_status ON zno.spateststatus=test_status.name
INNER JOIN location ON zno.spaptregname=location.name;
