-- server
SELECT count(*) FROM datawg.t_series_ser -- 185
SELECT count(*) FROM datawg.t_dataseries_das tdd ; --4150
--localhost
SELECT count(*) FROM datawg.t_series_ser -- 185
SELECT count(*) FROM datawg.t_dataseries_das tdd ; --4150

SELECT * FROM datawg.t_series_ser WHERE ser_cou_code IS NULL;
/*
Pandalus
NS-IBTS
BITS-4
BITS-1
*/

-- saving wkeelmigration data to the database
GRANT ALL ON SCHEMA wkeelmigration  TO wgeel ;


SELECT * FROM ref.tr_station 

SELECT ser_nameshort FROM datawg.t_series_ser ORDER BY ser_nameshort;

UPDATE ref.tr_station SET "Station_Name"='GuadG' WHERE "Station_Name"='Guadalquivir';
UPDATE ref.tr_station SET "Station_Name"='VeAmGY' WHERE "Station_Name"='Veurne-Ambacht';



-- join by removing 'G' or 'Y' that has been added to series names

WITH joined_despite_the_mess AS (
SELECT "tblCodeID", "Station_Name", ser_nameshort
FROM ref.tr_station 
JOIN datawg.t_series_ser ON substring(ser_nameshort,1, length(ser_nameshort)-1)="Station_Name")

UPDATE ref.tr_station SET "Station_Name" =
ser_nameshort
FROM joined_despite_the_mess
WHERE joined_despite_the_mess."tblCodeID"=tr_station."tblCodeID"; --57


-- searching for those not joined on the first operation

SELECT * FROM ref.tr_station  
EXCEPT
SELECT tr_station.* FROM ref.tr_station  JOIN
	 datawg.t_series_ser ON ser_nameshort="Station_Name";
	 
-- remove duplicate bann
DELETE FROM ref.tr_station WHERE "tblCodeID" = 170080;
UPDATE ref.tr_station SET "Station_Name" ='BannGY' WHERE "Station_Name"='Bann';
UPDATE ref.tr_station SET "Station_Name" ='BeeG' WHERE "Station_Name"='beeG';
UPDATE ref.tr_station SET "Station_Name" ='BresGY' WHERE "Station_Name"='Bres';
UPDATE ref.tr_station SET "Station_Name" ='BrokGY' WHERE "Station_Name"='Brok';
UPDATE ref.tr_station SET "Station_Name" ='EmsBGY' WHERE "Station_Name"='EmsB';
UPDATE ref.tr_station SET "Station_Name" ='ErneGY' WHERE "Station_Name"='Erne';
UPDATE ref.tr_station SET "Station_Name" ='FarpGY' WHERE "Station_Name"='Farp';
UPDATE ref.tr_station SET "Station_Name" ='FealGY' WHERE "Station_Name"='Feal';
UPDATE ref.tr_station SET "Station_Name" ='GreyGY' WHERE "Station_Name"='Grey';
UPDATE ref.tr_station SET "Station_Name" ='HellGY' WHERE "Station_Name"='Hell';
UPDATE ref.tr_station SET "Station_Name" ='HHKGY' WHERE "Station_Name"='HHK';
UPDATE ref.tr_station SET "Station_Name" ='HoSGY' WHERE "Station_Name"='HoS';
UPDATE ref.tr_station SET "Station_Name" ='InagGY' WHERE "Station_Name"='Inag';
UPDATE ref.tr_station SET "Station_Name" ='LangGY' WHERE "Station_Name"='Lang';
UPDATE ref.tr_station SET "Station_Name" ='LiffGY' WHERE "Station_Name"='Liff';
UPDATE ref.tr_station SET "Station_Name" ='ShaAGY' WHERE "Station_Name"='ShaA';
UPDATE ref.tr_station SET "Station_Name" ='StraGY' WHERE "Station_Name"='Stran';
UPDATE ref.tr_station SET "Station_Name" ='VerlGY' WHERE "Station_Name"='Verl';
UPDATE ref.tr_station SET "Station_Name" ='ViskGY' WHERE "Station_Name"='Visk';
UPDATE ref.tr_station SET "Station_Name" ='WisWGY' WHERE "Station_Name"='WisW';

-- ADD constraint to avoid this kind of problem in the future

ALTER TABLE REF.tr_station ADD CONSTRAINT c_fk_Station_Name FOREIGN KEY ("Station_Name") REFERENCES datawg.t_series_ser(ser_nameshort);



SELECT * FROM datawg.t_eelstock_eel WHERE eel_cou_code IS NULL; -- vattican for test, two rows
DELETE FROM datawg.t_eelstock_eel WHERE eel_cou_code IS NULL;



alter table datawg.t_series_ser add column ser_ccm_wso_id integer[];
update datawg.t_series_ser set 	ser_ccm_wso_id=ARRAY[88600] where ser_nameshort like 'Burr%';
update datawg.t_series_ser set 	ser_ccm_wso_id=ARRAY[88600] where ser_nameshort like 'BurS%';
update datawg.t_series_ser set 	ser_ccm_wso_id=ARRAY[88600] where ser_nameshort like 'BFuY%';
update datawg.t_series_ser set 	ser_ccm_wso_id=ARRAY[88600] where ser_nameshort like 'BuBY%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291194] where ser_nameshort like'AdTC%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291194] where ser_nameshort like'AdCP%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442593] where ser_nameshort like 'Albu%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[83746] where ser_nameshort like 'Bann%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291601] where ser_nameshort like 'BreS%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442353] where ser_nameshort like'Ebro%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[107] where ser_nameshort like 'EmsB%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[83773] where ser_nameshort like 'Erne%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[302338] where ser_nameshort like'Fre%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291126,291125] where ser_nameshort like'GiTC%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291126,291125] where ser_nameshort like'GiSc%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291126,291125] where ser_nameshort like'GiCP%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[92641] where ser_nameshort like'Yser%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[1055408] where ser_nameshort like'Imsa%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291110] where ser_nameshort like'Katw%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291110] where ser_nameshort like'Lauw%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291111] where ser_nameshort like'Loi%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442355] where ser_nameshort like'MiPo%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442355] where ser_nameshort like'MiSp%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291498] where ser_nameshort like'Nalo%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291110] where ser_nameshort like'RhDO%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[-2] where ser_nameshort like'Ring%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[84043] where ser_nameshort like 'Feal%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[85040] where ser_nameshort like 'Inag%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[84035] where ser_nameshort like'Maig%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[83750] where ser_nameshort like'SeEA%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291345] where ser_nameshort like'SevN%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[83747] where ser_nameshort like 'ShaA%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291110] where ser_nameshort like'Stel%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[129496] where ser_nameshort like'Tibe%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[1561] where ser_nameshort like'Vida%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291146] where ser_nameshort like'Vil%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[18491] where ser_nameshort like 'Visk%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[432326] where ser_nameshort like'Vac%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442355] where ser_nameshort like'Min%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442365] where ser_nameshort like'GuadG%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[442395] where ser_nameshort like'Mond%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[432326] where ser_nameshort like'Vac%';
update datawg.t_series_ser set ser_ccm_wso_id=ARRAY[291126] where ser_nameshort like 'GarY%';


-- check that no entry for glass eel stage and biometries in France
SELECT DISTINCT bio_lfs_code FROM datawg.t_biometry_series_bis 
JOIN datawg.t_series_ser ON bis_ser_id=ser_id
WHERE ser_cou_code='FR'
LIMIT 10 

update datawg.t_eelstock_eel set eel_area_division='27.3.d' 
where eel_emu_nameshort='EE_West' 
and eel_area_division is NULL
and eel_hty_code='C'
AND eel_typ_id IN (4,6);--(shiny + local)

/*
 * ISSUE #124
 * 
 */

UPDATE ref.tr_station SET ("Lat","Lon")=(ser_y, ser_x) from
(SELECT tr_station.*, ser_x, ser_y FROM ref.tr_station  JOIN
	 datawg.t_series_ser ON ser_nameshort="Station_Name") sub 
	WHERE tr_station."Station_Name"=sub."Station_Name"; --86 (shiny + local)
	 
/*
 * 
  * ISSUE #110 GY stages should be reserved for time series
 *  
 * */
	
SELECT * FROM datawg.t_eelstock_eel WHERE eel_lfs_code='GY'


/*
 * 
 * # 90 there is two series for yellow NO (ska and SkaY) ==> check for duplicates
*/

SELECT * FROM datawg.t_series_ser WHERE ser_cou_code='NO'

/*
 * 18/08/2020 C�dric
 * ADD CODE FOR 2020 
 * TODO RUN THIS LATER ON THE SERVER ONCE DEVELOPMENT IS FINISHED
*/


INSERT INTO REF.tr_datasource_dts  VALUES ('dc_2020', 'Joint EIFAAC/GFCM/ICES Eel Data Call 2020');


/*
 * Adding a datasource to tables t_series_ser, t_dataseries_das, and t_biometry_bio
 * Updating those using the last date of update
 * NULL values are set to wgeel_2016
 */

ALTER TABLE datawg.t_series_ser ADD COLUMN ser_dts_datasource varchar(100);
ALTER TABLE datawg.t_series_ser ADD CONSTRAINT c_fk_ser_dts_datasource FOREIGN KEY (ser_dts_datasource) REFERENCES ref.tr_datasource_dts (dts_datasource);
UPDATE datawg.t_series_ser SET ser_dts_datasource ='dc_2019'; --185

ALTER TABLE datawg.t_dataseries_das ADD COLUMN das_dts_datasource varchar(100);
ALTER TABLE datawg.t_dataseries_das ADD CONSTRAINT c_fk_das_dts_datasource FOREIGN KEY (das_dts_datasource) REFERENCES ref.tr_datasource_dts (dts_datasource);
WITH datasource AS (
	SELECT CASE WHEN das_last_update IS NULL THEN NULL
            WHEN das_last_update <'2018-01-01' THEN 'dc_2017'
            WHEN das_last_update >='2018-01-01' AND das_last_update <'2019-01-01'  THEN 'dc_2018'
            WHEN das_last_update >='2019-01-01'  THEN 'dc_2019'
            END AS dts_datasource,
            das_id
      FROM datawg.t_dataseries_das)
UPDATE datawg.t_dataseries_das SET das_dts_datasource = datasource.dts_datasource FROM datasource WHERE t_dataseries_das.das_id=datasource.das_id;--4150
      
ALTER TABLE datawg.t_biometry_bio ADD COLUMN bio_dts_datasource varchar(100);
ALTER TABLE datawg.t_biometry_bio ADD CONSTRAINT c_fk_bio_dts_datasource FOREIGN KEY (bio_dts_datasource) REFERENCES ref.tr_datasource_dts (dts_datasource);
WITH datasource AS (
	SELECT CASE WHEN bio_last_update IS NULL THEN NULL
            WHEN bio_last_update <'2018-01-01' THEN 'dc_2017'
            WHEN bio_last_update >='2018-01-01' AND bio_last_update <'2019-01-01'  THEN 'dc_2018'
            WHEN bio_last_update >='2019-01-01'  THEN 'dc_2019'
            END AS dts_datasource,
            bio_id
      FROM datawg.t_biometry_bio)
UPDATE datawg.t_biometry_bio SET bio_dts_datasource = datasource.dts_datasource FROM datasource WHERE t_biometry_bio.bio_id=datasource.bio_id; --1319
    
GRANT ALL ON SEQUENCE datawg.t_series_ser_ser_id_seq TO wgeel;

/* this piece of script aimed at fixing
*  issue https://github.com/ices-eg/wg_WGEEL/issues/92
*/
CREATE OR REPLACE FUNCTION checkemu_whole_country(emu text) RETURNS boolean AS $$
declare
exist boolean;
begin
 exist:=false;
 perform * from ref.tr_emu_emu where emu_nameshort=emu and emu_wholecountry=true;
 exist:=FOUND;
 RETURN exist;
end
$$ LANGUAGE plpgsql IMMUTABLE STRICT; 

ALTER TABLE datawg.t_eelstock_eel ADD CONSTRAINT ck_emu_whole_aquaculture CHECK (eel_qal_id!=1 or eel_typ_id != 11 or checkemu_whole_country(eel_emu_nameshort));


/* this piece of script aimed at fixing
*  issue https://github.com/ices-eg/wg_WGEEL/issues/93
*/
--to be checked with Esti, I think that the type is aquaculture_kg not aquaculture_number (anyway, it is declared at the emu scale not at the country scale so no valid)
update datawg.t_eelstock_eel set eel_typ_id =11,
								 eel_qal_id=20,
								 eel_comment ='type corrected in 2020' 
		where eel_typ_id =12 and eel_year=2014 and eel_emu_nameshort ='ES_Vale' and eel_lfs_code='OG' and eel_hty_code='MO'
--other data correspond to restocking so should not be in the db
delete from datawg.t_eelstock_eel where eel_typ_id=12;
ALTER TABLE datawg.t_eelstock_eel ADD CONSTRAINT ck_removed_typid CHECK (eel_typ_id != 12);

UPDATE datawg.t_biometry_other_bit SET bio_last_update='2019-09-08' WHERE bio_last_update IS NULL; --180
UPDATE datawg.t_biometry_series_bis SET bio_last_update='2019-09-08' WHERE bio_last_update IS NULL; --1194

/*
SELECT * FROM datawg.t_biometry_other_bit WHERE bio_id=6
SELECT * FROM datawg.t_biometry_series_bis tbsb WHERE bio_last_update IS NOT NULL;
SELECT * FROM datawg.t_biometry_series_bis tbsb WHERE bio_id IN (1363,1364) ;
*/

/*
 * 
 * Drop the ser_order series, we will order by cou_order and ser_y
 */


ALTER TABLE datawg.t_series_ser DROP COLUMN ser_order;

----------------------------------------------
-- DYNAMIC VIEWS FOR WGEEL
----------------------------------------------
DROP VIEW IF EXISTS datawg.series_stats CASCADE;
CREATE OR REPLACE VIEW datawg.series_stats AS 
 SELECT ser_id, 
 ser_nameshort AS site,
 ser_namelong AS namelong,
 min(das_year) AS min, max(das_year) AS max, 
 max(das_year) - min(das_year) + 1 AS duration,
 max(das_year) - min(das_year) + 1 - count(*) AS missing
   FROM datawg.t_dataseries_das
   JOIN datawg.t_series_ser ON das_ser_id=ser_id
   LEFT JOIN ref.tr_country_cou ON ser_cou_code=cou_code
  GROUP BY ser_id
  ORDER BY cou_order;

ALTER TABLE datawg.series_stats
  OWNER TO postgres;
 GRANT ALL ON TABLE datawg.series_stats TO wgeel;
    
 --select * from datawg.series_stats
 
 
----------------------------------------------
-- SERIES SUMMARY
----------------------------------------------
DROP VIEW IF EXISTS datawg.series_summary CASCADE;
CREATE OR REPLACE VIEW datawg.series_summary AS 
 SELECT ss.site AS site, 
 ss.namelong, 
 ss.min, 
 ss.max, 
 ss.duration,
 ss.missing,
 ser_lfs_code as life_stage,
 sam_samplingtype as sampling_type,
 ser_uni_code as unit,
 ser_hty_code as habitat_type,
 cou_order as order,
 ser_typ_id,
 ser_qal_id AS series_kept
   FROM datawg.series_stats ss
   JOIN datawg.t_series_ser ser ON ss.ser_id = ser.ser_id
   LEFT JOIN ref.tr_samplingtype_sam on ser_sam_id=sam_id
   LEFT JOIN REF.tr_country_cou ON cou_code=ser_cou_code
  ORDER BY cou_order, ser_y;

ALTER TABLE datawg.series_summary
  OWNER TO postgres;
 GRANT ALL ON TABLE datawg.series_summary TO wgeel;
  
---
-- view with distance to the sargasso
----



