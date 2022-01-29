CALL gds.graph.create('WCC', 'Client',
	{
    	SHARED_IDENTIFIERS:{
        	type: 'SHARED_IDENTIFIERS',
        	properties: {
            	count: {
                	property: 'count'
                }
            }
        }
	}
) YIELD graphName,nodeCount,relationshipCount,createMillis;
