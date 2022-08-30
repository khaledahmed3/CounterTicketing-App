
const db = require("./api/database");

async function setupDatabase(req, res, next) {

 await addDocuments("counter", [
    {
      title: "counter 1",
      status: "offline",
      current : 0,
      serving : false,
    },
    {
        title: "counter 2",
        status: "online",
        current : 0,
      serving : false,


      },
      {
        title: "counter 3",
        status: "offline",
        current : 0,
      serving : false,

      },
      {
        title: "counter 4",
        status: "offline",
        current : 0,
      serving : false,

      },
  ]);
  await addDocuments("ticket", [
    {
      ticket:1,
      current : 0
    },
  ]);

  res.send("Setting Up Database.... Done ");
}

async function deleteCollection(collection) {
  const cref = db.firestore.collection(collection);
  const docs = await cref.listDocuments();
  docs.forEach((doc) => doc.delete());
}

async function addDocuments(collection, docs) {
  await docs.forEach((doc) => db.create(collection, doc));
}

module.exports = setupDatabase;
