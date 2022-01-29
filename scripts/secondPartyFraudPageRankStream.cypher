CALL gds.pageRank.stream('SecondPartyFraudNetwork',{relationshipWeightProperty:'amount'})
YIELD nodeId,score
WITH gds.util.asNode(nodeId) AS client,score AS pageRankScore
WHERE exists(client.secondPartyFraudGroup)
RETURN client.secondPartyFraudGroup,client.name,labels(client),pageRankScore
ORDER BY client.secondPartyFraudGroup,pageRankScore DESC;
