CALL gds.degree.stream('Similarity',{nodeLabels:['Client'],relationshipTypes:['SIMILAR_TO'],relationshipWeightProperty:'jaccardScore'})
YIELD nodeId,score
RETURN gds.util.asNode(nodeId).id AS client,score
ORDER BY score DESC;
