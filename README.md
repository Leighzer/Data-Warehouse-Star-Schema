# Data-Warehouse-Star-Schema
Simple example data warehousing star schema implementation for sql server.

There is one fact table and other dimensions of the fact are normalized to separate tables.

The fact table serves to hold raw historical data, and dimensions of the fact are additional attributes by which you could aggregate by and analyze and perhaps make some insights like which branch has the most sales, or which is the most popular item, or why not both for Q2 of last year etc.