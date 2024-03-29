-- Purpose: This file contains the SQL query to retrieve the top 25 games by revenue.
SELECT g.gameTitle, SUM(td.units) AS totalUnitsSold, SUM(td.units * g.price) AS totalRevenue
FROM Games g
JOIN GamesConsoles gc ON g.gameID = gc.gameID
JOIN Inventory i ON gc.consoleID = i.gameconsoleID
JOIN TransactionDetails td ON i.inventoryID = td.inventoryID
GROUP BY g.gameTitle
ORDER BY totalRevenue DESC
LIMIT 25;