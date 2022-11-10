-- All Cities
SELECT CityName, State, U_EntDt FROM CITY ORDER BY U_EntDt DESC;


-- POs of the month october 2022
SELECT pod.DocId as DocId, pod.V_Type as V_Type, pod.V_Date as V_Date, pod.Site_Code as Site_Code, pod.ApprovedBy as ApprovedBy, pod.PreparedBy as PreparedBy, pod.ModifiedBy as MOdifiedBy, pod.U_EntDt as U_EntDt
FROM Technoculture.dbo.POrd pod
WHERE pod.V_Date >= cast('2022-10-01 00:00:00' as smalldatetime) AND pod.V_Date < cast('2022-11-01 00:00:00' as smalldatetime)
ORDER BY pod.V_Date


-- POs of the year 2022
SELECT TOP(100) pod.DocId as DocId, pod.V_Type as V_Type, pod.V_Date as V_Date, pod.Site_Code as Site_Code, pod.ApprovedBy as ApprovedBy, pod.PreparedBy as PreparedBy, pod.ModifiedBy as MOdifiedBy, pod.U_EntDt as U_EntDt
FROM Technoculture.dbo.POrd pod
WHERE pod.V_Date >= cast('2022-01-01 00:00:00' as smalldatetime)
ORDER BY pod.V_Date

-- customer details
SELECT TOP(100) SubCode, Manual_Code, Account_Name, Display_Name, Initial, So_Wo_Do, City, PIN, Phone, Mobile, E_Mail, Ac_Group, PAN
FROM Technoculture.dbo.V_CustomerMaster


-- list of all sites
SELECT pm.Code as PhaseCode, sm.Name as SiteName, pm.Name as PhaseName, pm.U_EntDt as U_EnDt, sm.StateCode as StateCode
FROM Technoculture.dbo.SiteMast as sm
RIGHT JOIN Technoculture.dbo.PhaseMast as pm
ON sm.Code = pm.Site_Code

-- PO details
SELECT Technoculture.dbo.POrdDetailProp.DocId , Technoculture.dbo.POrdDetailProp.V_Type , Technoculture.dbo.POrdProp.PartyCode , Technoculture.dbo.POrdDetailProp.Site_Code , Technoculture.dbo.POrdProp.U_EntDt , Technoculture.dbo.ItemMast.Code , Technoculture.dbo.POrdDetailProp.Unit , Technoculture.dbo.ItemMast.Name
FROM Technoculture.dbo.POrdDetailProp
INNER JOIN Technoculture.dbo.POrdProp
    ON Technoculture.dbo.POrdDetailProp.Site_Code = Technoculture.dbo.POrdProp.Site_Code
INNER JOIN Technoculture.dbo.ItemMast
    ON Technoculture.dbo.POrdDetailProp.ItemCode = Technoculture.dbo.ItemMast.Code;

-- PO Types
SELECT DISTINCT TOP(100) pod.V_Type as V_Type, vt.Description as Voucher_Description, pod.Site_Code as Site_Code, sm.Name as SiteName, podInt.CostCenter as CostCenter, cc.Name as CostCenterName
FROM Technoculture.dbo.POrd pod
JOIN Technoculture.dbo.POrdIndent as podInt
ON pod.DocId = podInt.DocId
JOIN Technoculture.dbo.Voucher_Type as vt
ON vt.V_Type = pod.V_Type
JOIN Technoculture.dbo.SiteMast as sm
ON pod.Site_Code = sm.Code
JOIN Technoculture.dbo.CostCenterMast as cc
ON podInt.CostCenter = cc.Code

-- Booking details
SELECT TOP(100) us.DocId, us.V_Type, us.V_Prefix, us.V_Date, us.U_EntDt, us.Site_Code, sm.Name as SiteName, sm.StateCode
FROM Technoculture.dbo.UnitSale as us
JOIN Technoculture.dbo.SiteMast as sm
ON us.Site_Code = sm.Code

-- Total number of POs
SELECT TOP(100) pod.DocId as DocId, pod.V_Type as V_Type, pod.V_Date as V_Date, pod.Site_Code as Site_Code, pod.ApprovedBy as ApprovedBy, pod.PreparedBy as PreparedBy, pod.ModifiedBy as MOdifiedBy, pod.U_EntDt as U_EntDt
FROM Technoculture.dbo.POrd pod
ORDER BY pod.V_Date
