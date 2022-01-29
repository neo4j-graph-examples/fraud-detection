CALL gds.graph.create.cypher('Similarity',
'MATCH(c:Client)
    WHERE exists(c.firstPartyFraudGroup)
    RETURN id(c) AS id,labels(c) AS labels
UNION
MATCH(n)
    WHERE n:Email OR n:Phone OR n:SSN
    RETURN id(n) AS id,labels(n) AS labels',
'MATCH(c:Client)
-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]->(ids)
WHERE exists(c.firstPartyFraudGroup)
RETURN id(c) AS source,id(ids) AS target')
YIELD graphName,nodeCount,relationshipCount,createMillis;
