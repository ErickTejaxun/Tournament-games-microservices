var express = require('express');
var router = express.Router();
var mysql = require('mysql');


var pool;


function inicarConexion()
{
  if(pool==null)
  {
    pool = mysql.createPool({
      connectionLimit : 10,
      host      : 'dbserver-torneo',
      user      : 'root',
      password  : 'root' ,
      database  : 'torneo_sa'  
    });
  }
}



function lanzarQuery(cadena)
{
  inicarConexion();  
  pool.query(cadena, function (error, results, fields) 
  {
    if (error) throw error;    
    console.log('Resultado Query', results);
    return results;
  });
}


/* GET home page. */
router.get('/', async function(req, res, next) 
{    
  var cadena = 'SELECT * FROM Juego';
  inicarConexion();  
  pool.query(cadena, function (error, results, fields) 
  {
    if (error) throw error;    
    console.log('Resultado Query', results);
    res.render('index', { title: 'Express', data: results[0] });
  });  
});

module.exports = router;
