class Product {
  static _client;
  static _tableName;
  static async bulkCreate(phonesArray) {
    const ValuesString = phonesArray
      .map(({ brand, module, quantity = 1, price, category }) => {
        return `('${brand}', '${module}', '${price}, '${quantity}, '${category}')`;
      })
      .join(",");

    const { rows } = await this._client.query(
      `INSERT INTO ${this._tableName}
        (brand, module, quantity = 1, price, category)VALUES
        ${ValuesString} RETURNING *;`
    );

    return rows;
  }
}

module.exports = Product
