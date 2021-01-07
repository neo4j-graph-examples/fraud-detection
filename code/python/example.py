# pip3 install neo4j-driver
# python3 example.py

from neo4j import GraphDatabase, basic_auth

driver = GraphDatabase.driver(
  "bolt://<HOST>:<BOLTPORT>", 
  auth=basic_auth("<USERNAME>", "<PASSWORD>"))

cypher_query = '''
MATCH (m:Merchant{name:$name})<-[:TO]-(:Transaction)<-[:PERFORMED]-(c:Client) 
RETURN c.name as client
'''

with driver.session(database="neo4j") as session:
  results = session.read_transaction(
    lambda tx: tx.run(cypher_query,
      name="MYrsa").data())

  for record in results:
    print(record['client'])

driver.close()