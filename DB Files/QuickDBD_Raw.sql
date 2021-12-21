OHT_Pricing
-
BudgetID PK varchar
EstimateID varchar fk >- OHT_estimateinfo.EstimateID
CostCode varchar fk >- OHT_costcodes.CostCode
EstimateAmount double
BudgetAmount double
BudgetType varchar
Budgeted double
Qualifications text
Specs text
Assumptions text
Alternatives text
Alternatives_inc text
CostType varchar
CSIDivision int
ScopeID varchar fk >- OHT_scopes.ScopeID
Bidder1 varchar
Bidder1_Amount double
Bidder1_Date date
Bidder2 varchar
Bidder2_Amount double
Bidder2_Date date
Bidder3 varchar
Bidder3_Amount double
Bidder3_Date date
Bidder4 varchar
Bidder4_Amount double
Bidder4_Date date

OHT_costcodes
-
CostCode PK varchar
CCCategory varchar
CCName varchar
CSIDivision int
DefaultCostType varchar
DefaultTrade varchar

OHT_scopes
----
ScopeID PK varchar
ScopeName varchar

OHT_projectinfo
------------
ProjectID PK varchar
ProjectName varchar
CompanyID varchar fk >- OHT_companies.CompanyID
ProjectRegion varchar fk >- OHT_regions.Region
ProjectAddress varchar
ProjectCity varchar
ProjectState varchar
Acres double
SoilType varchar fk >- OHT_soiltypes.SoilType
GroundWater varchar
EstStartDate date

OHT_companies
----
CompanyID PK varchar
CompanyAddress varchar
CompanyName varchar
CompanyType varchar

OHT_regions
------------
Region PK varchar

OHT_soiltypes 
----
SoilType PK varchar

OHT_estimateinfo
------------
EstimateID PK varchar
ProjectID varchar fk >- OHT_projectinfo.ProjectID
PlanLevel varchar
ProjectType varchar
ProjectSubType varchar fk >- OHT_projecttypes.ProjectSubType
TaxExempt varchar
HUD varchar
Student varchar
UnitCount int
BedCount int
NRSF double
Buildings int
Duration int
Milestone varchar
CreateTime date

OHT_projecttypes
---
ProjectSubType pk varchar
ProjectType varchar
