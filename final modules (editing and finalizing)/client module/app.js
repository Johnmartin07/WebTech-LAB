const express = require('express');
const mysql = require('mysql');
const path = require('path');

const app = express();

app.use(express.static(path.join('public')));

var bodyParser = require('body-parser')
app.use(bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

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
	db.query('SELECT * FROM musify.package where pack_status = "available"',function(err,results,fields){
		// console.log(results);
		res.render('index',{package: results});
	})	
});

//Connect to Musify website
app.get('/index/:uid', function (req, res) {
	uid = req.params.uid;

	res.redirect('/')
});

app.get('/transaction', function (req, res) {
	db.query(`SELECT payment.*,customer.firstname,customer.lastname,customer.address,package.pack_name FROM musify.payment
	inner join musify.package on package.pack_id = payment.pack_id
	inner join musify.customer on customer.cust_id = payment.cust_id
	WHERE payment.pack_id = package.pack_id and payment.pay_status = "paid"`,function (err, results, fields) {
	// console.log(results);
	res.render('transaction',{transaction: results});
	})
});

app.get('/editProfile', function (req, res) {
	var uid = 2;

	db.query('SELECT firstname,lastname,username,email,address FROM musify.customer WHERE cust_id = ?',[uid],function(err,results,fields){
		// console.log(results);
			res.render('editProfile',{customer: results[0] });
	})
});

app.post('/editProfile/save:uid', function (req, res) {
	var uid = req.params.uid;
	db.query('UPDATE customer SET on firstname,lastname,username,email,address FROM musify.customer WHERE cust_id = ?', function (err, res) {
		if (err) throw err;
		console.log(res.fname + "record(s) updated");
	})
	 fname = req.body.fname,
	 lname = req.body.lname,
	 uname = req.body.uname,
	 password = req.body.password,
	 password = req.body.password,
	 email = req.body.email,
	 address = req.body.address;
	console.log(req.body);
	res.redirect('editProfile');
});

app.get('/customerRequests', function (req, res) {

		db.query(`SELECT package.pack_name,rentals.*,customer.firstname,customer.lastname,customer.address FROM musify.rentals
	inner join musify.customer on customer.cust_id = rentals.cust_id
    inner join musify.package on rentals.pack_id = package.pack_id
	WHERE rentals.cust_id = customer.cust_id and rentals.rent_status = "pending"`,function (err, results, fields) {
	pending = results;
		db.query(`SELECT package.pack_name,rentals.*,customer.firstname,customer.lastname,customer.address FROM musify.rentals
	inner join musify.customer on customer.cust_id = rentals.cust_id
    inner join musify.package on rentals.pack_id = package.pack_id
	WHERE rentals.cust_id = customer.cust_id and rentals.rent_status = "accepted"`,function (err, results, fields) {
	accepted = results;
		db.query(`SELECT package.pack_name,rentals.*,customer.firstname,customer.lastname,customer.address FROM musify.rentals
	inner join musify.customer on customer.cust_id = rentals.cust_id
    inner join musify.package on rentals.pack_id = package.pack_id
	WHERE rentals.cust_id = customer.cust_id and rentals.rent_status = "declined"`,function (err, results, fields) {
	declined = results;
		db.query(`SELECT package.pack_name,rentals.*,customer.firstname,customer.lastname,customer.address FROM musify.rentals
	inner join musify.customer on customer.cust_id = rentals.cust_id
    inner join musify.package on rentals.pack_id = package.pack_id
	WHERE rentals.cust_id = customer.cust_id and rentals.rent_status = "done"`,function (err, results, fields) {
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