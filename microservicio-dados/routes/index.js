var express = require('express');
var router = express.Router();
var MAX_VAL = 6;
var MIN_VAL = 1;
/* GET home page. */
router.get('/tirar/:cantidad', function(req, res, next) 
{

    var numeroDatos = req.params.cantidad;
    const valores = [];
    if(numeroDatos<0)
    {
        res.status(400).json({status: 400, message: "Número de dados inválido."});
    }

    for(var i = 0; i<numeroDatos; i++ )
    {            
        valores.push(parseInt(Math.random() * (MAX_VAL - MIN_VAL) + MIN_VAL));
    }

    var respuesta = 
    {
        "dados":valores
    };
    
    res.json(respuesta);
});

module.exports = router;
