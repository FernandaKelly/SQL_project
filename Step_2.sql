-- !preview conn=con
CREATE TABLE BR_SPEI_3_PIVOT AS
PIVOT (SELECT
    cd_mun,
    nm_mun,
    sigla,
    ano_reep,
    mes_ano_reep,
    mes_num,
    spei_3,
    CASE
        WHEN spei_3 >= 2.0 THEN 'Extremely wet'
        WHEN spei_3 >= 1.5 THEN 'Very wet'
        WHEN spei_3 >= 1.0 THEN 'Moderately wet'
        WHEN spei_3 > -1.0 THEN 'Normal conditions'
        WHEN spei_3 >= -1.5 THEN 'Moderate drought'
        WHEN spei_3 >= -2.0 THEN 'Severe drought'
        WHEN spei_3 < -2.0 THEN 'Extreme drought'
        ELSE NULL
    END AS spei_3_cat
FROM BR_SPEI_3
WHERE cd_mun NOT IN ('4300001', '4300002')
)

ON mes_ano_reep
USING

FIRST(spei_3) AS spei_3, 
FIRST(spei_3_cat) AS spei_3_cat

GROUP BY
    cd_mun,
    nm_mun,
    sigla,
    ano_reep;
    
    
SHOW TABLES;

