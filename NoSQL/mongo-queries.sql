show dbs;

use test;

db.createCollection ("users");

show collections;

db.users.insertOne({"name": "Lovesh", "age": 24, 'email': "lk@gmail.com"});

db.users.insertMany([
    {"name": "Nilesh", "age": 30, 'email': "nd@gmail.com"},
    {"name": "Swati", "age": 26, 'email': "sx@gmail.com"},
]);


db.users.find()

db.users.updateOne({"name": "Lovesh"}, {$set:{"age": "45"}});

db.users.updateOne({"name": "Lovesh"}, {$set:{"age": "45", "email": 'asdh'}});


db.users.find()

db.users.insertOne({"name": "Aditya", "age": 42, 'email': "ap@gmail.com"});

db.users.insertOne({"name": "Aditya Pathak", "age": 24, 'email': "TEST@gmail.com"});

db.users.updateOne({"name": "Aditya"}, {$set:{"age": "ghjk", "email": '789f'}});

db.users.updateMany({"name": "Aditya"}, {$set:{"age": "dghj", "email": '586uhrd'}});

db.users.deleteOne({"name": "Aditya"});

db.users.find({"name": "Aditya"});

db.users.updateOne( { "name": "Aditya"}, {$push: {hobbies: "Python"}});

db.users.find({"hobbies": ("Coding", "Python")});

db.users.updateOne( { "name": "Aditya"}, {$pop: {hobbies: 1}});

db.users.updateOne( { "name": "Aditya"}, {$remove: {hobbies: ["gdgrt"]}});

db.users.find ();

db.users.updateMany({}, {$set: {"institute": "DSF"}});

db.users.deleteOne({hobbies: "TT"});

db.users.deleteMany({hobbies: "TT"});

db.users.updateMany({age: {$gte: 22}}, { $unset: { age: "" } });

db.users.updateMany(
  { 
    $or: [
      { institute: 'gh' },
      { age: "dghj" } 
    ] 
  },
  { $set: { institute: "qazxsw" } }
)

-- db.users.drop();

-- db.dropDatabase();


db.users.find({"name":{$eq: "Lovesh"}})
db.users.find({"name":{$ne: "Lovesh"}})
db.users.find({"name":{$gt: "Aditya"}})
db.users.find({"name":{$gte: "Aditya Pathak"}})
db.users.find({"age":{$gt: "0"}})
db.users.find({"age":{$gt: 0}})

db.users.find({"age":{$lt: "0"}})
db.users.find({"age":{$lte: 0}}) --less than equals too

db.users.find({"age":{$in: [20,25]}}) -- in this list only not range
db.users.find({"age":{$nin: [30,24,"dh"]}}) -- not in

db.users.find({$or: [ {"age": 30}, {"age": 26} ]})
db.users.find({$or: [{"age": 30}, {"age": 26}, {"age": "dh"}]})
db.users.find({$and: [{"age": 30}, {"name": "Nilesh"}]})
db.users.find({"age": {$not: {$ne:30}}})

db.users.find({$nor: [{age: 30}, {name:"Lovesh"}]})
-- $nand does not eqist it can be achive by,
  -- $not
db.users.find({ $nor: [ { age: 30, name: "Lovesh" } ] })
  -- combination of $not & $and
db.users.find({
  $expr: {
    $not: {
      $and: [
        { "age": 30 },
        { "name": "Nilesh" }
      ]
    }
  }
})
