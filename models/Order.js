const _ = require("lodash");

class Order {
  static _client;
  static _tableNames;

  static async bulckCreate(usersArray, productsArray) {
    // 1 створюємо нові замовлення
    //для 2 дії повертаємо з запиту id створених замовлень
    const ordersValuesString = usersArray
      .map((currentUser) =>
        // цей масив - всі замовлення поточного переглядаємого юзера в масиві
        // робимо рондомну кількість замовлень для кожного користувача
        new Array(_.random(1, 3, false)) // генеруємо від 1 до 3 замовлень
          .fill(null)
          .map(() => `(${currentUser.id})`)
          .join(",")
      )
      .join(",");
    const { rows: orders } = await this._client.query(
      `
        INSERT INTO ${this._tableNames[0]} (costumer_id)
        VALUES ${ordersValuesString}
        RETURNING id
        `
    );

    // 2 Нагенерувати позицій у кодже замовлення
    const productsToOrdersValuesString = orders
      .map((currentOrder) => {
        const positionArray = new Array(_.random(1, 4, false)) // для кожного замовлення генеруємо від 1 до 4 позицій у чеку
          .fill(null)
          .map(() => productsArray[_.random(0, productsArray.length - 1)]); // рондомно вибираємо якийсь товар з таблиці товарів

        return [...new Set(positionArray)]
          .map(
            (currentProduct) =>
              `(${currentOrder.id}, ${currentProduct.id}, ${_.random( 1,3, false )})`) // рондомно вибираємо кількість товарів
          .join(",");
      })
      .join(",");

  return  await this._client.query(
      `INSERT INTO ${this._tableNames[1]} (order_id, product_id, quntity)
        VALUES ${productsToOrdersValuesString}`
    );
  }
}

module.exports = Order;
