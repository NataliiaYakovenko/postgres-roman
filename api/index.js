module.exports.getUsers = async () => {
  const response = await fetch(
    "https://randomuser.me/api/?results=1000&seed=ONL"
  );
  const data = await response.json();
  console.log(data);
  return data.results;
};
