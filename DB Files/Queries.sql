insert into "OHT_soiltypes"("SoilType")
values(0)

delete from "OHT_projectinfo"
where "ProjectState" = 'TX'

select * from "OHT_projectinfo"

drop table "OHT_soiltypes" cascade