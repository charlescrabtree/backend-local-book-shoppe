const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('author routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('/authors should return lis of all authors', async () => {
    const res = await request(app).get('/authors');
    expect(res.status).toBe(200);
    expect(res.body.length).toBe(6);
    expect(res.body[0]).toEqual({
      id: expect.any(String),
      name: expect.any(String),
    });
  });

  it('GET /authors/:id should return author details and their books', async () => {
    const res = await request(app).get('/authors/4');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({
      id: expect.any(String),
      name: expect.any(String),
      dob: expect.any(String),
      pob: expect.any(String),
      books: expect.any(Array),
    });
    expect(res.body.books[0]).toEqual({
      id: expect.any(Number),
      title: expect.any(String),
      released: expect.any(Number),
    });
  });

  afterAll(() => {
    pool.end();
  });
});
