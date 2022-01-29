CALL gds.degree.write('Similarity',{nodeLabels:['Client'],
    relationshipTypes:['SIMILAR_TO'],
    relationshipWeightProperty:'jaccardScore',
    writeProperty:'firstPartyFraudScore'});
