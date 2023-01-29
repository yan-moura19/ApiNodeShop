const mongoose = require('mongoose')

const User = mongoose.model('User',{
    nome: String,
    usuario: String,
    senha: String
})

module.exports = User
