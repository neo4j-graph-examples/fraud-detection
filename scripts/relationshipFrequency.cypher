CALL db.relationshipTypes() YIELD relationshipType as type
CALL apoc.cypher.run('MATCH ()-[:`'+type+'`]->() RETURN count(*) as freq',{}) 
YIELD value
WITH type AS relationshipType, value.freq AS freq
CALL apoc.meta.stats() YIELD relCount
WITH *,3 AS presicion
WITH *, 10^presicion AS factor,toFloat(freq)/toFloat(relCount) as relFreq
RETURN relationshipType, freq AS frequency,
    round(relFreq*factor)/factor AS relativeFrequency
ORDER BY freq DESC;
