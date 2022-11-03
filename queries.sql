SELECT pm.Code as PhaseCode, sm.Name as SiteName, pm.Name as PhaseName, pm.U_EntDt as U_EnDt, sm.StateCode as StateCode
FROM Technoculture.dbo.SiteMast as sm
RIGHT JOIN Technoculture.dbo.PhaseMast as pm
ON sm.Code = pm.Site_Code
