-- https://platform.stratascratch.com/coding/9726-classify-business-type?code_type=1

SELECT DISTINCT business_name, 
    CASE 
        WHEN business_name ILIKE '%restaurant%' THEN 'restaurant'
        WHEN business_name ILIKE '%school%' THEN 'school'
        WHEN business_name ILIKE ANY (ARRAY['%cafe%', '%café%', '%coffee%']) THEN 'cafe'
        ELSE 'other'
    END
FROM sf_restaurant_health_violations