const { Client } = require("pg");
const { configs } = require("../configs/index");
const User = require("../models/User");

const client = new Client(configs);

User._client = client;
User._tableName = "users";

module.exports = {
  client,
  User,
};
