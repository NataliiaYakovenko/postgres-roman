const { Client } = require("pg");

const configs = {
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "students",
};

const client = new Client(configs);

const user = {
  firstName: "Diana",
  lastName: "Duwm",
  email: "dowm@gmail.com",
  isSubscribe: true,
  gender: 'female'
};

async function runRequest() {
  await client.connect();

  const response = await client.query(
    `INSERT INTO users(first_name, last_name, email, is_subscribe, gender)
         VALUES ('${user.firstName}','${user.lastName}','${user.email}', ${user.isSubscribe}, '${user.gender}')`
  );
  console.log(response);

  await client.end();
}

runRequest();
