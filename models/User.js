const { mapUsers } = require("../utils");

class User {
  static _client;
  static _tableName;

  static async findAll() {
    return await this._client.query(`SELECT * FROM ${this._tableName}`);
  }

  static async bulkCreate(usersArray) {
    return await this._client.query(
      `INSERT INTO users(first_name, last_name, email, is_subscribe, gender)
         VALUES ${mapUsers(usersArray)}`
    );
  }
}

module.exports = User;
