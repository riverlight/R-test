
mongo <- mongo.create(host = "10.10.171.218", username = "videopls", password = "c71e0de5d8811add202d8503c97370bd")

print(mongo.is.connected(mongo))

ns <- paste("bi2", "leon", sep=".")

buf <- mongo.bson.buffer.create()
mongo.bson.buffer.append(buf, "name", "Leon")
mongo.bson.buffer.append(buf, "age", 22L)
mongo.bson.buffer.append(buf, "gender", "Male")
mongo.bson.buffer.append(buf, "height", 176L)
mongo.bson.buffer.start.array(buf, "comments")
mongo.bson.buffer.append(buf, "0", "a1")
mongo.bson.buffer.append(buf, "1", "a2")
mongo.bson.buffer.append(buf, "2", "a3")
mongo.bson.buffer.finish.object(buf)
b <- mongo.bson.from.buffer(buf)

mongo.insert(mongo, ns, b)
buf <- mongo.bson.buffer.create()
mongo.bson.buffer.append(buf, "name", "Leon")
query <- mongo.bson.from.buffer(buf)

buf <- mongo.bson.buffer.create()
mongo.bson.buffer.start.object(buf, "$set")
mongo.bson.buffer.append(buf, "age", 30L)
mongo.bson.buffer.append(buf, "height", 175L)
mongo.bson.buffer.finish.object(buf)
op <- mongo.bson.from.buffer(buf)
mongo.update(mongo, ns, query, op)


buf <- mongo.bson.buffer.create()
mongo.bson.buffer.start.object(buf, "$inc")
mongo.bson.buffer.append(buf, "age", 2L)
mongo.bson.buffer.append(buf, "height", 4L)
mongo.bson.buffer.finish.object(buf)
op <- mongo.bson.from.buffer(buf)
mongo.update(mongo, ns, query, op)



mongo.destroy(mongo)