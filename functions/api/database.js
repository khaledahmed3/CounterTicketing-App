const _firebase = require("./models/firebase_admin");

class Database {
  constructor() {
    this.firestore = _firebase.firestore();
  }

  async create(collection, document) {
    const result = await this.firestore.collection(collection).add(document);
    document.id = result.id;

    return document;
  }

  async getList(collection) {
    const result = await this.firestore.collection(collection).get();
    const docList = [];
    result.forEach((doc) => {
      const data = doc.data();
      data.id = doc.id;
      docList.push(data);
    });

    return docList.length ? docList : null;
  }

  async get(collection, id) {
    const result = await this.firestore.collection(collection).doc(id).get();
    if (!result.exists) return null;

    const doc = result.data();
    doc.id = result.id;
    return doc;
  }

  async set(collection, id, document) {
    const doc = this.firestore.collection(collection).doc(id);
    const result = doc.get();
    if (!result.exists) return null;

    await doc.set(document);
    doc.id = id;
    return doc;
  }

  async delete(collection, id) {
    const doc = this.firestore.collection(collection).doc(id);
    const result = doc.get();
    if (!result.exists) return null;

    await doc.delete(document);

    return { id };
  }
}

module.exports = new Database();
