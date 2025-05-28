// Módulos principais
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const expressLayouts = require('express-ejs-layouts');
const Post = require ('./models/Post');

// Rotas
const indexRoutes = require('./routes/indexRoutes');
const authRoutes = require('./routes/authRoutes');
const adminRoutes = require('./routes/adminRoutes');

// Inicializa app
const app = express();
const PORT = process.env.PORT || 3001;

// Configura EJS e layouts
app.set('view engine', 'ejs');
app.set('layout', './layouts/layoutAuth');
app.set('views', path.join(__dirname, 'views'));
app.use(expressLayouts);


// Middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(methodOverride('_method'));

// Arquivos estáticos (imagens, CSS, JS)
app.use(express.static(path.join(__dirname, 'public')));

// Rotas
app.use('/', indexRoutes);
app.use('/auth', authRoutes);
app.use('/admin', adminRoutes);

// Inicializa o servidor
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
