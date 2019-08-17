module.exports = function (req, res, next) {
	console.log(`got request on ${req.originalUrl}`)
	next()
}