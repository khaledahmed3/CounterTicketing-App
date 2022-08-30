const Controller = require('./controller')
const counterModel = require('../models/counter_model')

const counterController = new Controller(counterModel)
module.exports = counterController.router
