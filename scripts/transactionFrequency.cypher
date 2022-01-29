MATCH (t:Transaction)
WITH sum(t.amount) AS globalSum, count(t) AS globalCnt
WITH *, 10^3 AS scaleFactor
UNWIND ['CashIn', 'CashOut', 'Payment', 'Debit', 'Transfer'] AS txType
  CALL apoc.cypher.run('MATCH (t:' + txType + ') 
    RETURN sum(t.amount) as txAmount, count(t) AS txCnt', {}) 
  YIELD value
RETURN txType,value.txAmount AS TotalMarketValue,
  100*round(scaleFactor*(toFloat(value.txAmount)/toFloat(globalSum)))
    /scaleFactor AS `%MarketValue`,
  100*round(scaleFactor*(toFloat(value.txCnt)/toFloat(globalCnt)))
    /scaleFactor AS `%MarketTransactions`,
  toInteger(toFloat(value.txAmount)/toFloat(value.txCnt)) AS AvgTransactionValue,
  value.txCnt AS NumberOfTransactions
ORDER BY `%MarketTransactions` DESC;
