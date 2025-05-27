var express = require('express');
var router = express.Router();

router.get('/entrada', (req, res) => {
    res.render('pri/entrada');  
});

router.get('/cadastro', (req, res) => {
    res.render('pri/cadastro');  
});

module.exports = router;