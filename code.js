//jquery initialisieren 

// Express initialisieren
const express = require('express');
const app = express()

// Public-Ordner für öffentliche Elemente wie Bilder angeben
app.use(express.static( "public" ));

// Body-Parser initialisieren
const bodyParser = require('body-parser')
app.use(bodyParser.urlencoded({extended: true}))

// EJS Template Engine initialisieren
app.engine('.ejs', require('ejs').__express);
app.set('view engine', 'ejs');

// Server starten
const port = 3000;
app.listen(port, function() {
	console.log('listening on port' + port);
});

// Express-Session initialisieren
const session = require('express-session');
app.use(session({
	secret: 'example',
	resave: false,
	saveUninitialized: true
}));
