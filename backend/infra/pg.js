const knex = require('knex')
const config = require('./config')

const instance = knex({
	client: 'pg',
	connection: config.pg,
	pool: {
		min: 6,
		max: 24,
	},
	acquireConnectionTimeout: config.pgTimeout,
})

module.exports = instance