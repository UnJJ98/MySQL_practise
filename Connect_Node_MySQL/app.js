//*****Install `Faker` via command line:*****
//'npm install @faker-js/faker'>>enter to terminal
var { faker } = require('@faker-js/faker');

//*****Install the `mysql2` Node Package:*****
//'npm install mysql2'>>enter to terminal
var mysql = require('mysql2');

//*****Install `express`:*****
//'npm install express --save'>>enter to terminal
var express = require('express');

//*****Install `ejs`:*****
//'npm install --save ejs'>>enter to terminal
//要新建檔案名為`views`,且home.ejs在裡面。

//*****Install `bodyParser`:*****
//'npm install --save body-parser'>>enter to terminal
var bodyParser = require("body-parser");

//*****Establish `package.json`:*****
//'npm init'>>enter to terminal //記錄專案設定與所有套件資訊

//*****Connect to MySQL*****

var connection = mysql.createConnection({
  host: '127.0.0.1',
  port: 3306,
  user: 'root',
  password: 'derekun98',
  database: 'exercise'
});

//*****Select use Node*****

// var q = 'SELECT * FROM node';

// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

//*****Insert use Node*****

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
 

//*****Connecting The Form*****
var app = express();
 
app.set("view engine", "ejs");

app.use(express.static(__dirname + "/public")); //Connect CSS and EJS

app.use(bodyParser.urlencoded({extended: true}));

app.get("/web", function(req, res){
 var q = 'SELECT COUNT(*) as count FROM node';
 connection.query(q, function (err, result) {
 if (err) throw err;
 var count = result[0].count;
 res.render("home", {data: count});
 });
});

app.post('/register', function(req,res){
 var person = {email: req.body.email};
 connection.query('INSERT INTO node SET ?', person, function(err, result) {
 console.log(err);
 console.log(result);
 res.redirect("/web");
 });
});

app.listen(8080, function () {
 console.log('App listening on port 8080!');
});

//>>http://localhost:8080/web

//*****Other Example*****

// app.get("/", function(req, res){
//  res.send("HELLO FROM OUR WEB APP!");
// });

// app.get("/joke", function(req, res){
//  var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
//  res.send(joke);
// });

// app.get("/random_num", function(req, res){
//  var num = Math.floor((Math.random() * 10) + 1);
//  res.send("Your lucky number is " + num);
// });

//app.get("/user", function(req, res){
//  var q = 'SELECT COUNT(*) as count FROM node';
//  connection.query(q, function (error, results) {
//  if (error) throw error;
//  var msg = "We have " + results[0].count + " users";
//  res.send(msg);
//  });
// });