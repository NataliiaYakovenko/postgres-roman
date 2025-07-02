const { Client } = require("pg");
const { mapUsers } = require("./utils/index");
const { configs } = require("./configs/index");
const { getUsers } = require("./api/index");

const client = new Client(configs);

async function runRequest() {
  await client.connect();

  const usersArray = await getUsers();

  console.log(`INSERT INTO users(first_name, last_name, email, is_subscribe, gender)
         VALUES ${mapUsers(usersArray)}`);

  const response = await client.query(
    `INSERT INTO users(first_name, last_name, email, is_subscribe, gender)
         VALUES ${mapUsers(usersArray)}`
  );
  console.log(response);

  await client.end();
}

runRequest();
