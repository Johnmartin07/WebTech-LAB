const express = require('express');
const mysql = require('mysql');
const http = require('http');
const app = express();

//create connection

const db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'musify'
});

//Connect
db.connect((err) => {
	if(err){
		throw err
	}
	console.log('Mysql Connected..');
});

app.get('/', function (req,res) {
	res.sendFile('/Users/Elyssa Manresa Stiff/Desktop/WebTech-Lab/final modules (editing and finalizing)/client module/index.html');
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




http.createServer(function (req,res) {
	res.writeHead(200, {
		'Content-Type': 'text/html'
	});
	res.write('<!DOCTYPE html> \n <html lang= "en"> \n ')
})


var server = http.createServer (function (req, res) {
	res.writeHead(200, {'Content-Type' : 'text/html'});
	var readStream = fs.createReadStream(__dirname + '/index.html', 'utf-8');
	readStream.pipe(res);
});