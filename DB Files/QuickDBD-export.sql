-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "OHT_Pricing" (
    "BudgetID" varchar   NOT NULL,
    "EstimateID" varchar   NOT NULL,
    "CostCode" varchar   NOT NULL,
    "EstimateAmount" float   NOT NULL,
    "BudgetAmount" float   NOT NULL,
    "BudgetType" varchar   NOT NULL,
    "Budgeted" float   NOT NULL,
    "Qualifications" text   NOT NULL,
    "Specs" text   NOT NULL,
    "Assumptions" text   NOT NULL,
    "Alternatives" text   NOT NULL,
    "Alternatives_inc" text   NOT NULL,
    "CostType" varchar   NOT NULL,
    "CSIDivision" int   NOT NULL,
    "ScopeID" varchar   NOT NULL,
    "Bidder1" varchar   NOT NULL,
    "Bidder1_Amount" float   NOT NULL,
    "Bidder1_Date" date   NOT NULL,
    "Bidder2" varchar   NOT NULL,
    "Bidder2_Amount" float   NOT NULL,
    "Bidder2_Date" date   NOT NULL,
    "Bidder3" varchar   NOT NULL,
    "Bidder3_Amount" float   NOT NULL,
    "Bidder3_Date" date   NOT NULL,
    "Bidder4" varchar   NOT NULL,
    "Bidder4_Amount" float   NOT NULL,
    "Bidder4_Date" date   NOT NULL,
    CONSTRAINT "pk_OHT_Pricing" PRIMARY KEY (
        "BudgetID"
     )
);

CREATE TABLE "OHT_costcodes" (
    "CostCode" varchar   NOT NULL,
    "CCCategory" varchar   NOT NULL,
    "CCName" varchar   NOT NULL,
    "CSIDivision" int   NOT NULL,
    "DefaultCostType" varchar   NOT NULL,
    "DefaultTrade" varchar   NOT NULL,
    CONSTRAINT "pk_OHT_costcodes" PRIMARY KEY (
        "CostCode"
     )
);

CREATE TABLE "OHT_scopes" (
    "ScopeID" varchar   NOT NULL,
    "ScopeName" varchar   NOT NULL,
    CONSTRAINT "pk_OHT_scopes" PRIMARY KEY (
        "ScopeID"
     )
);

CREATE TABLE "OHT_projectinfo" (
    "ProjectID" varchar   NOT NULL,
    "ProjectName" varchar,
    "CompanyID" varchar,
    "ProjectRegion" varchar,
    "ProjectAddress" varchar,
    "ProjectCity" varchar,
    "ProjectState" varchar,
    "Acres" float,
    "SoilType" varchar,
    "GroundWater" varchar,
    "EstStartDate" date,
    CONSTRAINT "pk_OHT_projectinfo" PRIMARY KEY (
        "ProjectID"
     )
);

CREATE TABLE "OHT_companies" (
    "CompanyID" varchar   NOT NULL,
    "CompanyAddress" varchar,
    "CompanyName" varchar,
    "CompanyType" varchar,
    CONSTRAINT "pk_OHT_companies" PRIMARY KEY (
        "CompanyID"
     )
);

CREATE TABLE "OHT_regions" (
    "Region" varchar   NOT NULL,
    "Region Name" varchar,
    CONSTRAINT "pk_OHT_regions" PRIMARY KEY (
        "Region"
     )
);

CREATE TABLE "OHT_soiltypes" (
    "SoilType" varchar   NOT NULL,
    CONSTRAINT "pk_OHT_soiltypes" PRIMARY KEY (
        "SoilType"
     )
);

CREATE TABLE "OHT_estimateinfo" (
    "EstimateID" varchar   NOT NULL,
    "ProjectID" varchar,
    "PlanLevel" varchar,
    "ProjectType" varchar,
    "ProjectSubType" varchar,
    "TaxExempt" varchar,
    "HUD" varchar,
    "Student" varchar,
    "UnitCount" int,
    "BedCount" int,
    "NRSF" float,
    "Buildings" int,
    "Duration" int,
    "Milestone" varchar,
    "CreateTime" date,
    CONSTRAINT "pk_OHT_estimateinfo" PRIMARY KEY (
        "EstimateID"
     )
);

CREATE TABLE "OHT_projecttypes" (
    "ProjectSubType" varchar   NOT NULL,
    "ProjectType" varchar,
    CONSTRAINT "pk_OHT_projecttypes" PRIMARY KEY (
        "ProjectSubType"
     )
);

ALTER TABLE "OHT_Pricing" ADD CONSTRAINT "fk_OHT_Pricing_EstimateID" FOREIGN KEY("EstimateID")
REFERENCES "OHT_estimateinfo" ("EstimateID");

ALTER TABLE "OHT_Pricing" ADD CONSTRAINT "fk_OHT_Pricing_CostCode" FOREIGN KEY("CostCode")
REFERENCES "OHT_costcodes" ("CostCode");

ALTER TABLE "OHT_Pricing" ADD CONSTRAINT "fk_OHT_Pricing_ScopeID" FOREIGN KEY("ScopeID")
REFERENCES "OHT_scopes" ("ScopeID");

ALTER TABLE "OHT_projectinfo" ADD CONSTRAINT "fk_OHT_projectinfo_CompanyID" FOREIGN KEY("CompanyID")
REFERENCES "OHT_companies" ("CompanyID");

ALTER TABLE "OHT_projectinfo" ADD CONSTRAINT "fk_OHT_projectinfo_ProjectRegion" FOREIGN KEY("ProjectRegion")
REFERENCES "OHT_regions" ("Region");

ALTER TABLE "OHT_projectinfo" ADD CONSTRAINT "fk_OHT_projectinfo_SoilType" FOREIGN KEY("SoilType")
REFERENCES "OHT_soiltypes" ("SoilType");

ALTER TABLE "OHT_estimateinfo" ADD CONSTRAINT "fk_OHT_estimateinfo_ProjectID" FOREIGN KEY("ProjectID")
REFERENCES "OHT_projectinfo" ("ProjectID");

ALTER TABLE "OHT_estimateinfo" ADD CONSTRAINT "fk_OHT_estimateinfo_ProjectSubType" FOREIGN KEY("ProjectSubType")
REFERENCES "OHT_projecttypes" ("ProjectSubType");

