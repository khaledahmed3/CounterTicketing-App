const Model = require('./model')

// Here, we are implementing the class with Singleton design pattern

class TicketModel extends Model {
    constructor() {
        super('ticket')
        if (this.instance) return this.instance
        TicketModel.instance = this
    }
}

module.exports = new TicketModel()