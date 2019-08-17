const pg = require('../../infra/pg.js')

module.exports = async function (req, res) {
	const masters = await pg('users as u')
		.join('user_types as ut', 'ut.id', 'u.type')
		.where('ut.name', 'master')
		.select('u.id', 'u.name', 'login')
	return res.status(200).send(masters)
}