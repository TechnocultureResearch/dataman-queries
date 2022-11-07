SELECT pm.Code as PhaseCode, sm.Name as SiteName, pm.Name as PhaseName, pm.U_EntDt as U_EnDt, sm.StateCode as StateCode
FROM Technoculture.dbo.SiteMast as sm
RIGHT JOIN Technoculture.dbo.PhaseMast as pm
ON sm.Code = pm.Site_Code

SELECT SubCode, Manual_Code, Account_Name, Display_Name, Initial, So_Wo_Do, City, PIN, Phone, Mobile, E_Mail, Ac_Group, PAN
FROM Technoculture.dbo.V_CustomerMaster
