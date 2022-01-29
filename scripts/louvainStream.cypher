CALL gds.louvain.stream('SecondPartyFraudNetwork',{relationshipWeightProperty:'amount'})
YIELD nodeId,communityId
WITH gds.util.asNode(nodeId) AS client,communityId AS clusterId
WITH clusterId,collect(client.id) AS cluster,10^3 AS factor,
	avg(client.firstPartyFraudScore) AS meanFirstPartyFraudScore,
    avg(client.secondPartyFraudScore) AS meanSecondPartyFraudScore
WITH clusterId,size(cluster) AS clusterSize,cluster,
	round(meanFirstPartyFraudScore * factor)/factor AS meanFirstPartyFraudScore,
    CASE 
    	WHEN meanSecondPartyFraudScore IS NULL THEN 0
        ELSE round(meanSecondPartyFraudScore * factor)/factor
    END AS meanSecondPartyFraudScore
WHERE clusterSize>1
RETURN clusterId,clusterSize,cluster,meanFirstPartyFraudScore,meanSecondPartyFraudScore
ORDER BY meanSecondPartyFraudScore DESC,meanFirstPartyFraudScore DESC,clusterSize DESC;
