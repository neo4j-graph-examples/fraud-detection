CALL apoc.meta.data() YIELD label,property,type,elementType
WHERE type<>'RELATIONSHIP'
RETURN elementType,label,property,type
ORDER BY elementType,label,property;
