const Post = require('../models/Post');

var express = require('express');
var router = express.Router();

router.get('/usuarios', (req, res) => {
    Post.findAll().then(function(posts){                  //atualmente é findAll e não só all

    res.render('admin/usuarios', {posts: posts, layout: './layouts/layoutAdmin'});  
    })
});

module.exports = router;