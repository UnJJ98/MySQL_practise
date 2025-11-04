//****1.Node****
// for(var i = 0; i < 500; i++){
//   console.log("HELLO WORLD!");
// }


//****2.Faker****
// var { faker } = require('@faker-js/faker');

// // console.log(faker.internet.email())

// function generateAddress(){
// console.log(faker.location.streetAddress());
// console.log(faker.location.city());
// console.log(faker.location.state());
// }

// generateAddress();


//****3.Connectting to MySQL****
// var mysql = require('mysql2');

// var connection = mysql.createConnection({
//   host: '127.0.0.1',
//   port: 3306,
//   user: 'root',
//   password: 'derekun98',
//   database: 'exercise'
// });

// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//    if (error) throw error;
//    console.log('The solution is: ', results[0].solution);
// });


// var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });

// connection.end();


//****4.Select use Node****
// var q = 'SELECT * FROM node';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// connection.end();


//****5.Insert use Node****
// var q = 'INSERT INTO node (email) VALUES ("rusty_the_dog@gmail.com")';
 
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// connection.end();

//****An easier approach that allows for dynamic data****
// var { faker } = require('@faker-js/faker');

// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };

// var end_result = connection.query('INSERT INTO node SET ?', person, function(err, result) {
//   if (err) throw err;
//   console.log(result);
// });

// connection.end();



//****6.Insert lots of data****
// var { faker } = require('@faker-js/faker');

// var data = [];
// for(var i = 0; i < 500; i++){
//     data.push([
//         faker.internet.email(),
//         faker.date.past()
//     ]);
// }
 
// var q = 'INSERT INTO node (email, created_at) VALUES ?';
 
// connection.query(q, [data], function(err, result) {
//   console.log(err);
//   console.log(result);
// });
 
// connection.end();