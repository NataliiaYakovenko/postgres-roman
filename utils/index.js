
  module.exports.mapUsers = (usersArray) => {
  return usersArray.map((currentUser) => 
      `('${currentUser.firstName}','${currentUser.lastName}','${currentUser.email}', ${currentUser.isSubscribe}, '${currentUser.gender}')`
    )
    .join(', ');
};
