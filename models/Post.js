const db = require('./db');

const Post = db.sequelize.define('teste', {
    nome: {
        type: db.Sequelize.STRING(40),
        allowNull: false
    },
    CPF: {
        type: db.Sequelize.CHAR(14),
        allowNull: false,
        unique: true
    },
})

module.exports = Post