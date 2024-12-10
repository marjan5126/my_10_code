
-- 1 Retrieve all relief distributions that occurred in the last 7 days
SELECT * 
FROM ReliefDistribution
WHERE Date >= CURRENT_DATE - INTERVAL 7 DAY;

-- 2 Find all health reports created in the month of December 2024
SELECT * 
FROM HealthReport
WHERE MONTH(Date) = 12 AND YEAR(Date) = 2024;

-- 3  List all volunteer assignments that are currently active
SELECT * 
FROM VolunteerAssignment
WHERE StartDate <= CURRENT_DATE AND (EndDate IS NULL OR EndDate >= CURRENT_DATE);


-- 4 Count the number of health reports for each day

SELECT Date, COUNT(*) AS ReportCount
FROM HealthReport
GROUP BY Date;

-- 5 Retrieve all relief distributions scheduled for today
SELECT * 
FROM ReliefDistribution
WHERE Date = CURRENT_DATE;


-- 6 Retrieve all resources and their suppliers' information
SELECT RI.ResourceID, RI.Type, RI.Quantity, ISup.Name AS SupplierName, ISup.ContactInfo
FROM ResourceInventory RI
JOIN InventorySupplier ISup ON RI.SupplierID = ISup.SupplierID;


-- 7 Find all relief distributions along with household details

SELECT RD.DistributionID, RD.Date, RD.ItemsDistributed, H.HouseholdName, H.Address
FROM ReliefDistribution RD
JOIN Household H ON RD.HouseholdID = H.HouseholdID;

-- 8 List all health reports with medical center details
SELECT HR.ReportID, HR.Date, MC.Name AS MedicalCenterName, MC.Location, HR.Diagnosis, HR.Treatment
FROM HealthReport HR
JOIN MedicalCenter MC ON HR.MedicalCenterID = MC.MedicalCenterID;

-- 9 Retrieve the details of all health reports for a specific resident
SELECT * 
FROM HealthReport
WHERE ResidentID = 3001;

-- 10  Show the distribution dates along with the total items distributed
SELECT Date, COUNT(ItemsDistributed) AS TotalItems
FROM ReliefDistribution
GROUP BY Date;




