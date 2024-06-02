--����� ���� ������ ����� �� ����� ��� ���� ����� �����
SELECT po.Production_Order_ID, po.Tool_ID, po.Quantity, po.Start_Date, po.Due_Date, po.Status, t.Tool_Name
FROM Production_Orders po
JOIN Tools t ON po.Tool_ID = t.Tool_ID
WHERE po.Due_Date > TO_DATE('&due_date', 'YYYY-MM-DD');

--����� ������ �� ������ ������� ����� ������� ����
SELECT m.Machine_ID, m.Machine_Name, mm.Maintenance_Date, mm.Maintenance_Type, mm.Status
FROM Machines m
JOIN Machine_Maintenance mm ON m.Maintenance_ID = mm.Maintenance_ID
WHERE mm.Maintenance_Date BETWEEN TO_DATE('&start_date', 'YYYY-MM-DD') AND TO_DATE('&end_date', 'YYYY-MM-DD');

-- ����� ���� ������ ���� ������ ����� ������ �����
SELECT Warehouse_ID, Warehouse_Location, Capacity, Current_Quantity
FROM Warehouses
WHERE Capacity > &capacity;

-- ����� ���� ����� ��� ������� ����� ���� ����� ������
SELECT Material_ID, Material_Name, Quantity_in_Stock, Supplier
FROM Raw_Materials
WHERE Quantity_in_Stock < &max_quantity;
