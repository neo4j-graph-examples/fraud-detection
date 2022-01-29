MATCH path=(c:Client)
-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]->(ids)
WHERE c.id IN [$clients['client1'],$clients['client2']] 
RETURN path;
