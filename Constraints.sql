-- ���� ����� ����� ������� ����� ����� ������ �����
ALTER TABLE Raw_Materials
ADD CONSTRAINT chk_quantity CHECK (Quantity_in_Stock > 0);

--����� ��� ����� ����� ���� ��� ������� ���� ���� �� ����� ������
ALTER TABLE Machines
MODIFY Status varchar2(100) DEFAULT 'Active';

-- ���� ������ ������ �� ����� ������ �� ���� ����� ���� ������ �����
ALTER TABLE Production_Orders
ADD CONSTRAINT chk_start_date CHECK (Start_Date <= Due_Date);

