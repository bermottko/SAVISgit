//Conectando com o mysql
const Sequelize = require('sequelize');
const sequelize = new Sequelize('savisdb', 'root', 'Be#99493544',{
  host: "localhost",
  dialect: "mysql"
})

module.exports = {
    Sequelize: Sequelize, 
    sequelize: sequelize
}