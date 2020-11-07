const express = require('express'),
  bodyParser = require('body-parser'),
  jwt = require('jsonwebtoken'),
  config = require('./config/config'),
  app = express();

var PORT = 3333;


app.set('llave',config.llave);

app.use(bodyParser.urlencoded({ extended: true}));

app.use(bodyParser.json());

app.listen(PORT,()=>
{
  console.log('Iniciando servidor de tokens en el puerto '+PORT);
});


app.post('/tokens', function(req, res)
{
  if(req.body.id==="usuario" && req.body.secret==='contraseña')
  {
    const payload = 
    {
      check:true
    };

    const token = jwt.sign(payload, app.get('llave'),
    {
      expiresIn: 1440*2
    });

    res.json({
      mensaje: "Autenticación correcta",
      jwt: token
    });
  }
  else
  {
    res.status(400).json({status: 400, message: "Usuario o secret no válido."});
  }
});