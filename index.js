const { Client } = require("pg");
const { mapUsers } = require("./utils/index");

const configs = {
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "students",
};

const client = new Client(configs);

const usersArray = [
  {
    firstName: "Tom",
    lastName: "Tomson",
    email: "tom@gmail.com",
    isSubscribe: true,
    gender: "male",
  },
  {
    firstName: "Jerry",
    lastName: "Jons",
    email: "jons@gmail.com",
    isSubscribe: true,
    gender: "female",
  },
  {
    firstName: "Lora",
    lastName: "Pol",
    email: "lora@gmail.com",
    isSubscribe: true,
    gender: "female",
  },
];

async function runRequest() {
  await client.connect();

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
