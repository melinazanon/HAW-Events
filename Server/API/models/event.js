const mongoose = require('mongoose');

const eventSchema= mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: {type:String, required:true},
    contact: {type: String, required: false},
    start: {type: Date, required: true},
    end: {type: Date, required: true},
    room: {type: String, required: true},
    type: {type: String, required: true},
    department: {type: String, reqired: true},
    website: {type: String, reqired: false},
    description: {type: String, reqired: false},
    image: {type: String, default: 'uploads\\haw.png'}
});

module.exports = mongoose.model('Event',eventSchema);