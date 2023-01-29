const mongoose = require('mongoose')

const Compra = mongoose.model('Compra',{
    usuario : String,
    produtos : String,
    valor: String

})

module.exports = Compra