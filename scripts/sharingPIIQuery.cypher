MATCH (c1:Client)-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]->(info)
<-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]-(c2:Client)
WHERE c1.id<>c2.id
RETURN c1.id,c2.id,count(*) AS freq ORDER BY freq DESC;
