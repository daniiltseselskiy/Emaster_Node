// index.js
// Main API file.. starts it all
// Initial script and routes definitions goes here
// eMasters Connection API
// Called from the Lambda API dispatcher

// =============================================================================
//                                 BASE SETUP
// =============================================================================

// Let's define the basics : Express, the app object and the parser.
var express = require('express');
var app = express();
var bodyParser = require('body-parser');

// Let's link the app object to the bodyParser
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// Let's define the basic router object
var router = express.Router();

// =============================================================================
//                                 And our API
// =============================================================================

//Get the call for the functions
let action = require("./action");

// Root Endpoint.. in case
router.route('/').get(function(req, res) {
     res.send('eMasters connection API!')
});

// Endpoint that lanches a connection
router.route('/connect').post(function(req, res) {
     action.respond(req.body, res);
});


//Define base api call
app.use('/', router);

// =============================================================================
//                                 SERVER and EXPOSURE
// =============================================================================

// Let's define host and port
const PORT = 8080;
const HOST = '0.0.0.0';

// Let's fire up the server ;)
app.listen(PORT, HOST);
console.log('eMasterss connection API is running.. and it happens in '+ HOST + ' on port ' + PORT);

//Export for test units to see
module.exports = app;
