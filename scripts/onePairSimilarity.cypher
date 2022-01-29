MATCH (c1:Client)
-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]->(ids) 
WHERE c1.id=$clients['client1']
WITH c1,collect(id(ids)) AS ids1
MATCH (c2:Client)
-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]->(ids) 
WHERE c2.id=$clients['client2']
WITH c1,ids1,c2,collect(id(ids)) AS ids2
RETURN c1.id,c2.id,
	gds.alpha.similarity.jaccard(ids1,ids2) AS similarityScore;
