CALL db.labels() YIELD label
CALL apoc.cypher.run('MATCH (:`'+label+'`) RETURN count(*) as freq',{}) 
YIELD value
WITH label,value.freq AS freq
CALL apoc.meta.stats() YIELD nodeCount
WITH *,3 AS presicion
WITH *,10^presicion AS factor,toFloat(freq)/toFloat(nodeCount) AS relFreq
RETURN label AS nodeLabel, freq AS frequency,round(relFreq*factor)/factor AS relativeFrequency ORDER BY freq DESC;
