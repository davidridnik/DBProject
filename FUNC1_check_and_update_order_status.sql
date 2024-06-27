CREATE OR REPLACE FUNCTION check_and_update_order_status(order_id IN INTEGER) RETURN VARCHAR2 AS
    order_status VARCHAR2(100);
    order_due_date DATE;
BEGIN
    -- ����� ����� ������ ����� ��� ������ ������ ����
    SELECT status, due_date INTO order_status, order_due_date
    FROM production_orders
    WHERE production_order_id = order_id;

    -- ����� �� ������ ����� ���� Processing ����� ���� �� �due_date
    IF order_status = 'Processing' AND order_due_date < SYSDATE THEN
        -- ����� ��� ������ �-Completed
        UPDATE production_orders
        SET status = 'Completed'
        WHERE production_order_id = order_id;
        RETURN 'Order ' || order_id || ' status updated to Completed';
    ELSE
        RETURN 'Order ' || order_id || ' status remains ' || order_status;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Order ' || order_id || ' not found';
    WHEN OTHERS THEN
        RETURN 'Error checking/updating order status';
END check_and_update_order_status;
/
