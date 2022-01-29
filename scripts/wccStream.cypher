CALL gds.wcc.stream('WCC')
YIELD componentId,nodeId
WITH componentId AS cluster,gds.util.asNode(nodeId) AS client
WITH cluster,collect(client.id) AS clients
WITH *,size(clients) AS clusterSize
WHERE clusterSize>1
RETURN cluster,clusterSize,clients
ORDER by clusterSize DESC;
