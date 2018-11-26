import mysqlx

# Connect to server on localhost
session = mysqlx.get_session({
    "host": "localhost",
    "port": 33060,
    "user": "root",
    "password": "root"
})

# Get schema object
schema = session.get_schema("test")

# Use the collection "my_collection"
collection = schema.get_collection("my_collection")
collection.add("{'name:','MySQL'}").execute()
# Specify which document to find with Collection.find()
result = collection.find("name = 'MySQL'").execute()
# Print document
docs = result.fetch_all()

print docs
#print("Name: {0}".format(docs[0]["name"]))

session.close()