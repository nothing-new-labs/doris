SET enable_nereids_planner=TRUE;
SET enable_fallback_to_original_planner=FALSE;
-- tables: lineitem,supplier
SELECT
  s_suppkey,
  s_name,
  s_address,
  s_phone,
  total_revenue
FROM
  supplier,
  revenue1
WHERE
  s_suppkey = supplier_no
  AND total_revenue = (
    SELECT max(total_revenue)
    FROM
      revenue1
  )
ORDER BY
  s_suppkey;
