const mongoose = require('mongoose');
const Event = require('../models/event');

exports.events_get_all = (req,res,next)=>{
    Event.find()
        .exec()
        .then(docs => {
            const response = {
                count: docs.length,
                events: docs.map(doc => {
                    return{
                        name: doc.name,
                        contact: doc.contact,
                        date: doc.date,
                        start: doc.start,
                        end: doc.end,
                        room: doc.room,
                        type: doc.type,
                        department: doc.department,
                        website: doc.website,
                        description: doc.description,
                        image: doc.image,
                        _id: doc._id,
                        request:{
                            type: 'GET',
                            url: 'http://localhost:3000/events/'+doc._id
                        }
                    }
                })
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
    const event = new Event({
        _id: new mongoose.Types.ObjectId,
        name: req.body.name,
        contact: req.body.contact,
        date: req.body.date,
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
                date: result.date,
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
                        date: 'String',
                        start: 'String',
                        end: 'String',
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