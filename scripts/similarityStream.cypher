CALL gds.nodeSimilarity.stream('Similarity',{topK:15})
YIELD node1,node2,similarity
RETURN gds.util.asNode(node1).id AS client1,
    gds.util.asNode(node2).id AS client2,similarity
ORDER BY similarity;
