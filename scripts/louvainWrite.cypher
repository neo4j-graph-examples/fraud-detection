CALL gds.louvain.stream('SecondPartyFraudNetwork',{relationshipWeightProperty:'amount'})
YIELD nodeId,communityId
WITH gds.util.asNode(nodeId) AS client,communityId AS clusterId
WITH clusterId,collect(client) AS cluster
WITH clusterId,size(cluster) AS clusterSize,cluster
WHERE clusterSize>1
UNWIND cluster AS client
MATCH(c:Client)
WHERE c.id=client.id
SET c.secondPartyFraudInnerGroup=clusterId;
