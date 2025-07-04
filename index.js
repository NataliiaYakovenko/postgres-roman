const { User, client } = require("./models/User");
const { getUsers } = require("./api/index");

async function runRequest() {
  await client.connect();

  const usersArray = await getUsers();

  const response = await User.bulkCreate(usersArray);
  console.log(response);

  await client.end();
}

runRequest();
