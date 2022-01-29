CALL gds.nodeSimilarity.mutate('Similarity',{topK:15,
  mutateProperty:'jaccardScore', mutateRelationshipType:'SIMILAR_TO'});
