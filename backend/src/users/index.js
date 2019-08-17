const express = require('express')
const pg = require('../../infra/pg.js')

const router = express.Router()

router.get('/masters', getMastersList)
router.post('/masters', createMaster)

async function getMastersList (req, res) {
	const masters = await pg('users as u')
		.join('user_types as ut', 'ut.id', 'u.type')
		.where('ut.name', 'master')
		.select('u.id', 'u.name', 'login')
	return res.status(200).send(masters)
}

async function createMaster(req, res) {
	const master = req.body
	console.log(master)
}

module.exports = router