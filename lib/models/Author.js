const pool = require('../utils/pool');

class Author {
  constructor(row) {
    this.is = row.id;
    this.name = row.name;
    this.dob = row.dob;
    this.pob = row.pob;
    this.books = row.books;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * from authors');
    return rows.map(
      (authorRow) => new Author({ id: authorRow.id, name: authorRow.name })
    );
  }
}

module.exports = Author;
