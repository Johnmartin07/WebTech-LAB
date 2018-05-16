const express = require('express');
const mysql = require('mysql');
const http = require('http');
const path = require('path');

const app = express();

app.use(express.static(path.join('public')));

app.set('view engine', 'pug');
app.set('views', './view');

//create connection to MySQL
const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'musify'
});

//Connect to MySQL
db.connect((err) => {
	if(err){
		throw err
	}
	console.log('Mysql Connected..');
});

//Connect to Musify website
app.get('/', function (req, res) {
	res.sendFile(path.join(__dirname + '/index.html'));
});

app.get('/editProfile', function (req, res) {
	 let view = request.query.view;

	let db = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: '',
		database: 'musify'
	});

	const query = `SELECT firstname,lastname,username,email,address
			   	   FROM customer
			   	   WHERE username = 'ikaw'`;

	db.connectionn(err =>{
		if(err) throw err;

		db.query(query,[username],(err, result, fields) =>{
			if (err) throw err;

			switch(view) {
				case 'html':
				response.render('editProfile');

				default:
					response.redirect(error404.html);
					break;
			}
		});
	}); 	   

});

//Insert package
app.get('/addpost1', (req,res) =>{
	let port = {title: 'Package One', body:'First Package'};
	let sql = 'INSERT INTO package SET ?';
	let query = db.query(sql, post, (err, result) =>{
		if (err) throw err;
		console.log(result);
		res.send('Package one added');
	});
});

//select package
app.get('/getposts', (req, res) => {
    let sql = 'SELECT * FROM package';
    let query = db.query(sql, (err, results) => {
        if(err) throw err;
        console.log(results);
        res.send('Posts fetched...');
    });
});

// Select single post
app.get('/getpost/:id', (req, res) => {
    let sql = `SELECT * FROM package  = ${req.params.id}`;
    let query = db.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result);
        res.send('Package fetched...');
    });
});

app.listen('2001', () =>{
	console.log('Server started on port 2001');
});