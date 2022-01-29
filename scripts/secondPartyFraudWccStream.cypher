CALL gds.wcc.stream('SecondPartyFraudNetwork')
YIELD nodeId,componentId
WITH gds.util.asNode(nodeId) AS client,componentId AS clusterId
WITH clusterId,collect(client.id) AS cluster
WITH clusterId,size(cluster) AS clusterSize,cluster
WHERE clusterSize>1
RETURN clusterId,clusterSize
ORDER BY clusterSize DESC;
