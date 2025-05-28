var express = require('express');
var router = express.Router();

/* Carrega a pagina inicial */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Savis' });
});

module.exports = router;
