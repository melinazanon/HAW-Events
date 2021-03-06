const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const eventRoutes = require('./api/routes/events');
const userRoutes = require('./api/routes/users');

mongoose.connect(
    //'mongodb+srv://jimmies:'+process.env.Mongo+'@cluster0-0qbpp.mongodb.net/haw_events?retryWrites=true',
    'mongodb://event:event@localhost:27017/event?retryWrites=true',
    {useNewUrlParser: true}
);
mongoose.Promise= global.Promise;

app.use(morgan('dev'));
app.use('/uploads',express.static('uploads'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use((req,res,next)=>{
    res.header('Access-Control-Allow-Origin','*');
    res.header(
        'Access-Control-Allow-Headers',
        'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    );
    if (req.method === 'OPTIONS'){
        res.header(
            'Access-Control-Allow-Methods',
            'GET, POST, PUT, PATCH, DELETE'
        );
        return res.status(200).json({});
    }
    next();
});

app.use('/events',eventRoutes);
app.use('/users', userRoutes);

app.use((req,res,next)=>{
    const error = new Error('Not found');
    error.status = 404;
    next(error);
});

app.use((error,req,res,next)=>{
    res.status(error.status || 500);
    res.json({
        error:{
            message: error.message
        }
    })
});
module.exports = app;