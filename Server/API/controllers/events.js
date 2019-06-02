const mongoose = require('mongoose');
const Event = require('../models/event');

exports.events_get_all = (req,res,next)=>{
    Event.find()
        .select('name contact start end room type department description _id image')
        .exec()
        .then(docs => {
            const response = {
                count: docs.length,
                events: docs
            };
            res.status(200).json(response);
        })
        .catch(err =>{
            console.log(err);
            res.status(500).json({
                error:err
            });
        });
}

exports.events_get_one = (req,res,next)=>{
    const id= req.params.eventId;
    Event.findById(id)
        .select('name contact start end room type department description _id image')
        .exec()
        .then(doc =>{
            console.log(doc);
            if (doc){
                res.status(200).json({
                    event: doc,
                    request:{
                        type: 'GET',
                        url: 'http://localhost:3000/events'
                    }
                });
            }
            else{
                res.status(404).json({
                    message: 'No valid entry found for provided Id'
                });
            }  
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({error: err});
        });
}

exports.events_create = (req,res,next)=>{
    Event.findOne({room: req.body.room, $or: [{start: {$gte: req.body.start,$lt: req.body.end}},{start: {$lt: req.body.start},end: {$gt: req.body.start}}]})
        .exec()
        .then(eventfound =>{
            if(eventfound){
                return res.status(409).json({
                    message: 'Room is already booked'
                });
            }
            else{
                const event = new Event({
                    _id: new mongoose.Types.ObjectId,
                    name: req.body.name,
                    contact: req.body.contact,
                    start: req.body.start,
                    end: req.body.end,
                    room: req.body.room,
                    type: req.body.type,
                    department: req.body.department,
                    website: req.body.website,
                    description: req.body.description,
                    image: req.file.path
                });
                event
                    .save()
                    .then(result =>{
                    console.log(result);
                    res.status(201).json({
                        message:'Created Event successfully',
                        createdEvent: {
                            name: result.name,
                            start: result.start.getDate()+"."+(result.start.getMonth()+1)+"."+result.start.getFullYear(),
                            _id: result._id,
                            request:{
                                type: 'GET',
                                url: 'http://localhost:3000/events/'+result._id
                            }
                        }
                    });
                })
                .catch(err =>{
                    console.log(err);
                    res.status(500).json({
                        error: err
                    })
                });
            }

        });
}

exports.events_delete = (req,res,next)=>{
    const id = req.params.eventId;
    Event.remove({_id: id})
        .exec()
        .then(result =>{
            res.status(200).json({
                message: 'Event deleted',
                request:{
                    type: 'POST',
                    url: 'http://localhost:3000/events',
                    body:{
                        name: 'String',
                        contact: 'String',
                        start: 'Date',
                        end: 'Date',
                        room: 'String',
                        type: 'String',
                        department: 'String',
                        website: 'String',
                        description: 'String',
                        image: 'File'
                    }
                }
            });
        })
        .catch(err =>{
            console.log(err);
            res.status(500).json({
                error: err
            });
        });   
}

exports.events_update = (req,res,next)=>{
    const id = req.params.eventId;
    const updateOps ={};
    for (const ops of req.body){
        updateOps[ops.propName]= ops.value;
    }
    Event.update({_id: id},{$set: updateOps})
        .exec()
        .then(result => {
            res.status(200).json({
                message: 'Event updated',
                request:{
                    type: 'GET',
                    url: 'http://localhost:3000/events/'+ id
                }
            });
        })
        .catch(err =>{
            console.log(err);
            res.status(500).json({
                error: err
            });
        });
}