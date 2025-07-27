class Product {
  static _client;
  static _tableName;

static async bulkCreate(phonesArray) {
  const ValuesString = phonesArray
    .map(({ brand, module, quantity = 1, price, category }) => {
      return `('${brand}', '${module}', ${price}, ${quantity}, '${category}')`;
    })
    .join(",");

  const { rows } = await this._client.query(
    `INSERT INTO ${this._tableName}
      (brand, module, price, quantity, category)
      VALUES ${ValuesString}
      RETURNING *;`
  );

  return rows;
}
  
  static async findAll() {
    return await this._client.query(`SELECT * FROM ${this._tableName}`);
  }
}

module.exports = Product;
