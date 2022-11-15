const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('book routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('/books should return list of all books', async () => {
    const res = await request(app).get('/books');
    expect(res.status).toBe(200);
    expect(res.body.length).toBe(19);
    expect(res.body[0]).toEqual({
      id: expect.any(String),
      title: expect.any(String),
      released: expect.any(Number),
    });
  });

  it('/books/:id should return a book and its author', async () => {
    const res = await request(app).get('/books/14');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      title: expect.any(String),
      released: expect.any(Number),
      authors: [{
        id: expect.any(Number),
        name: expect.any(String)
      }],
    });
  });

  afterAll(() => {
    pool.end();
  });
});
