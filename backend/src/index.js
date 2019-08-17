const pg = require('../infra/pg.js')
const express = require('express')
const session = require('express-session')
const cors = require('cors')
const { check, validationResult } = require('express-validator')
const bodyParser = require('body-parser')

const checkAuthorise = require('./checkAuthorise')
const users = require('./users')
const logQuery = require('./logQuery.js')

const app = express()

app.use(bodyParser())
app.use(cors())

app.use(session({
   secret: 'Yurka', //TODO move to into PROCESS.ENV
   cookie: {}
}))
app.use(logQuery)

app.use('/users', users)

app.post('/login', [
  check('login', 'minimal length is 1 symbol').isLength({min: 1}),
  check('pass', 'minimal length is 1 symbol').isLength({min: 1}),
  ], login)

async function login (req, res) {
  const errors = validationResult(req).array()
  if (errors.length) {
    return res.status(400).send(errors)
  }

  const { login, pass } = req.body
  const user = await pg('users')
    .where({login, password: pass})
    .first()
  if (user) {
    req.session.user = { ...user }
    return res.status(200).send(user)
  }
  return res.status(400).send('Incorrect pass or login')
}

app.listen(process.env.BACKEND_PORT, function() {
  console.log(`app listening on port ${process.env.BACKEND_PORT}`)
})