const router = require('express').Router()

const Compra = require('../models/Compra')

router.post('/', async (req, res) => {
    const {usuario, produtos, valor} = req.body
    console.log(req.body);
    console.log(usuario, produtos, valor);
    if(!usuario){
        return res.status(404).json({msg : "O usuario é obrigatório"})
    }
    if(!produtos){
        return res.status(404).json({msg : "O produto é obrigatório"})
    }
    if(!valor){
        return res.status(404).json({msg : "O valor é obrigatório"})
    }
    

    const compra = {
        usuario,
        produtos,
        valor
    }
    try{
        await Compra.create(compra)
        res.status(200).json({msg: "Compra inserida com sucesso! "})

    }catch(e){
        res.status(500).json({msg: "Erro ao conectar com o servidor "})

    }
})

router.get('/',async (req,res)=>{
    try {
        const compra = await Compra.find()
        res.status(200).json(compra)

        
    } catch (error) {
        res.status(500).json({msg: "Erro ao conectar com o servidor "})
        
    }
})

module.exports = router