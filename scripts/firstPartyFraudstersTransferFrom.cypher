MATCH (c1:Client:FirstPartyFraudster)<-[]-(t:Transaction)<-[]-(c2:Client)
WITH c1,c2,sum(t.amount) AS totalAmount
CREATE (c1)<-[:TRANSFER_TO {amount:totalAmount}]-(c2);
