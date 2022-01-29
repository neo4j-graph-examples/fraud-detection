CALL gds.pageRank.stream('SecondPartyFraudNetwork',{relationshipWeightProperty:'amount'})
YIELD nodeId,score
WITH gds.util.asNode(nodeId) AS client,score AS pageRankScore
WHERE exists(client.secondPartyFraudGroup)
	AND pageRankScore >1 AND NOT client:FirstPartyFraudster
MATCH(c:Client {id:client.id})
SET c:SecondPartyFraud
SET c.secondPartyFraudScore=pageRankScore;
