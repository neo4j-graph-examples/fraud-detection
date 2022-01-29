MATCH (c:Client)
WITH c.firstPartyFraudGroup AS fpGroupID, collect(c.id) AS fGroup
WITH *, size(fGroup) AS groupSize WHERE groupSize >= 9
WITH collect(fpGroupID) AS fraudRings
MATCH p=(c:Client)-[:SIMILAR_TO]->()
WHERE c.firstPartyFraudGroup IN fraudRings
RETURN p
