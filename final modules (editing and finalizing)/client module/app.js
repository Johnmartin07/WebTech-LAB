const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();

app.use(express.static(path.join('public')));

var bodyParser = require('body-parser')
app.use(bodyParser.json() );       
app.use(bodyParser.urlencoded({extended: false })); 

app.set('view engine', 'ejs');
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
	console.log('Successfully Connected to MusifydB..');
});

//Connect to Musify website
app.get('/index', function (req, res) {
	db.query('SELECT pack_name, pack_desc FROM musify.package where pack_status = "available"',function(err,results,fields){
		res.render('index',{package : results});
	})	
});

//Packages
app.get('/MultiparticipantMeetingStyleSoundPackage', function (req, res) {
	res.render('MultiparticipantMeetingStyleSoundPackage');
});

app.get('/Openeventspacesoundpackage', function (req, res) {
	res.render('Openeventspacesoundpackage');
});

app.get('/BanquetRoom', function(req, res) {
	res.render('BanquetRoom');	
});

app.get('/OutdoorSoundPackage', function(req, res) {
	res.render('OutdoorSoundPackage');	
});

app.get('/PanelDiscussionSoundPackage', function(req, res) {
	res.render('PanelDiscussionSoundPackage');	
});

app.get('/PressConferences', function(req, res) {
	res.render('PressConferences');	
});

app.get('/PrivateDinning', function(req, res) {
	res.render('PrivateDinning');	
});

//Connect to Musify website (Login)
app.get('/index/:uid', function (req, res) {
	uid = req.params.uid;

	res.redirect('/')
});

//Transaction Page
app.get('/transaction', function (req, res) {
	db.query(`SELECT payment.*,customer.firstname,customer.lastname,customer.address,package.pack_name FROM musify.payment
	inner join musify.package on package.pack_id = payment.pack_id
	inner join musify.customer on customer.cust_id = payment.cust_id
	WHERE payment.pack_id = package.pack_id and payment.pay_status = "paid"`,function (err, results, fields) {
	// console.log(results);
	res.render('transaction',{transaction: results});
	})
});

//Edit profile page
app.get('/editProfile', function (req, res) {
	var uid = 5;

	db.query('SELECT firstname,lastname,username,email FROM musify.customer WHERE custid = ?',[uid],function(err,results,fields){
		// console.log(results);
			res.render('editProfile',{customer: results[0] });
	})
});

//Edit profile page (login)
app.post('/editProfile:uid', function (err, results) {
	var uid = 2;
	firstname = req.body.firstname,
	lastname = req.body.lastname,
	username = req.body.username,
	password = req.body.password,
	password = req.body.password,
	address = req.body.address,
	email = req.body.email;
	db.query('UPDATE musify.customer SET on firstname = ?,lastname = ?,username = ?,password = ?, email = ?,address = ? WHERE cust_id = ?',[firstname, lastname, username, password, email, address, uid], function (err, res) {
		console.log(firstname, lastname, username, password, address, email);
		if (err) throw err;
		res.redirect('editProfile:uid');
	})
});

//Customer Request Page	
app.get('/customerRequests', function (req, res) {

		db.query(`SELECT * FROM musify.rentals where rent_status = "pending"`,function (err, results, fields) {
	pending = results;
		db.query(`SELECT * FROM musify.rentals where rent_status = "accepted"`,function (err, results, fields) {
	accepted = results;
		db.query(`SELECT * FROM musify.rentals where rent_status = "declined"`,function (err, results, fields) {
	declined = results;
		db.query(`SELECT * FROM musify.rentals where rent_status = "done"`,function (err, results, fields) {
	done = results;
		console.log(accepted);
		console.log(pending);
		console.log(declined);
		console.log(done);
		res.render('customerRequests',{pending: pending, accepted: accepted, declined: declined, done: done});
		})
		})
		})
		})
});

app.listen('2001', () =>{
	console.log('Server started on port 2001');
});