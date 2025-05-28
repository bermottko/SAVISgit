const Post = require('../models/Post');

var express = require('express');
var router = express.Router();

router.get('/entrada', (req, res) => {
    res.render('auth/entrada');  
});

router.get('/cadastro', (req, res) => {
    res.render('auth/cadastro');  
});

router.post('/add', (req, res) => {
   Post.create({
    nome: req.body.nome,
    CPF: req.body.CPF
}). then(function(){
    res.redirect('/admin/usuarios')
}). catch(function(erro){
    res.send("Não foi cadastrado " + erro)
})
});

module.exports = router;
