create database flights_data;
use flights_data;
/* =====================================================
   Project: Airline Ticket Price Analysis
   Author: Abhishek Bity
   Tools: SQL, Power BI
   ===================================================== */

/* 1. Airline-wise Flight Distribution */
SELECT airline,
       COUNT(*) AS total_flights
FROM airlines
GROUP BY airline
ORDER BY total_flights DESC;

/* 2. Average Ticket Price by Airline */
SELECT airline,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY airline
ORDER BY avg_price DESC;

/* 3. Route-wise Price Analysis (Source → Destination) */
SELECT source_city,
       destination_city,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY source_city, destination_city
ORDER BY avg_price DESC;

/* 4. Impact of Booking Time (Days Left) */
SELECT days_left,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY days_left
ORDER BY days_left;

/* 5. Economy vs Business Class Comparison */
SELECT class,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY class;

/* 6. Price Variation by Departure Time */
SELECT departure_time,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY departure_time
ORDER BY avg_price DESC;

/* 7. Price Variation by Arrival Time */
SELECT arrival_time,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY arrival_time
ORDER BY avg_price DESC;

/* 8. Stops vs Ticket Price */
SELECT stops,
       ROUND(AVG(price), 2) AS avg_price
FROM airlines
GROUP BY stops
ORDER BY avg_price DESC;

/* 9. Business Case:
      Avg price for Vistara | Delhi to Hyderabad | Business Class */
SELECT ROUND(AVG(price), 2) AS avg_price
FROM airlines
WHERE airline = 'Vistara'
  AND source_city = 'Delhi'
  AND destination_city = 'Hyderabad'
  AND class = 'Business';


