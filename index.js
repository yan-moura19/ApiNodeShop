require('dotenv').config()
const express = require('express')
const mongoose = require('mongoose')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const app = express()

app.use(express.json())

const User = require('./models/User')


const compraRoutes = require('./routes/compraRoutes')

app.use('/compra', compraRoutes)



app.get('/', (req,res) => {
    res.status(200).json({msg: "Api funcionando"})
})
app.get('/users/:id', checkToken ,async (req, res) =>{
    const id = req.params.id

    const user = await User.findById(id, '-senha')
    
    if(!user){
        return  res.status(404).json({msg : "Esse usuario não existe"})
    }
    res.status(200).json({user})
})

function checkToken(req, res , next){
    const authHeader = req.headers['authorization']
    const token = authHeader && authHeader.split(' ')[1]
    
    if(!token){
        return res.status(401).json({msg: "Acesso negado!"})
    }
    
    try{
        const secret =  process.env.SECRET

        jwt.verify(token, secret)
        next()
    }catch(e){
        return res.status(400).json({msg: "Token invalido!"})

    }
}

const dbuser = process.env.DB_USER
const dbpass = process.env.DB_PASS

app.post("/auth/login", async (req,res) =>{
    const {usuario, senha}= req.body

    if(!usuario){
        return res.status(422).json({msg : "O usuario é obrigatório"})
    }
    if(!senha){
        return res.status(422).json({msg : "A senha é obrigatório"})
    }
    const user = await User.findOne({usuario : usuario})

    if(!user){
        return res.status(404).json({msg : "Esse usuario não existe"})

    }

    const checkPassword = await bcrypt.compare(senha, user.senha)

    if(!checkPassword){
        return res.status(422).json({msg : "A senha é inválida!"})

    }
    try{

        const secret = process.env.SECRET

        const token = jwt.sign({
            usuario: usuario,
        },
        secret,)
        res.status(200).json({msg: "Autenticação realizada!", token})

    }catch(e){
        console.log(erro)
        res.status(500).json({
            msg: "Erro no servidor, tente novamente"
        })

    }


})

app.post('/auth/register', async(req,res) => {
    const {nome, usuario, senha} = req.body

    if(!nome){
        return res.status(422).json({msg : "O nome é obrigatório"})
    }
    if(!usuario){
        return res.status(422).json({msg : "O usuario é obrigatório"})
    }
    if(!senha){
        return res.status(422).json({msg : "A senha é obrigatório"})
    }

    const userExists = await User.findOne({usuario : usuario})

    if(userExists){
        return res.status(422).json({msg : "Esse e-mail já está sendo utilizado"})

    }
    
    const salt = await bcrypt.genSalt(12)
    const passwordHash = await bcrypt.hash(senha, salt)
    
    

    const user = new User({
        nome,
        usuario,
        senha: passwordHash
    })
    

    try{
        await user.save()

        res.status(201).json({msg: "Usuário criado com sucesso"})

    }catch(e){
        res.status(500).json({msg: 'Erro no servidor, tente novamente'})

    }

})



mongoose.connect(`mongodb+srv://${dbuser}:${dbpass}@cluster0.cgpljyi.mongodb.net/?retryWrites=true&w=majority`)
        .then(()=>{
            app.listen(3030)
            console.log("Conectou ao banco!")

        })
        .catch((error) => console.log(error))
