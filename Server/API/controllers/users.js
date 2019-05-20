const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const User= require('../models/user');

exports.users_create = (req,res,next)=> {
    User.findOne({name: req.body.name})
        .exec()
        .then(user => {
            if(user){
                return res.status(409).json({
                    message: 'Username already exists'
                });
            }
            else{
                bcrypt.hash(req.body.password,10,(err,hash)=> {
                    if(err){
                        return res.status(500).json({
                            error: err
                        });
                    }
                    else{
                        const user = new User({
                            _id: new mongoose.Types.ObjectId(),
                            name: req.body.name,
                            password: hash
                        }); 
                        user
                            .save()
                            .then(result =>{
                                console.log(user);
                                res.status(201).json({
                                    message: 'User created'
                                });
                            })
                            .catch(err => {
                                console.log(err);
                                res.status(500).json({
                                    error:err
                                });
                            });
                    }
                });

            }
        });
}

exports.users_login = (req,res,next) =>{
    User.findOne({name: req.body.name})
        .exec()
        .then(user => {
            if(user === null) {
                return res.status(401).json({
                    message: 'Auth failed'
                });
            }
            bcrypt.compare(req.body.password,user.password, (err, result)=>{
                if(err){
                    return res.status(401).json({
                        message: 'Auth failed'
                    });
                }
                if(result){
                    const token =jwt.sign(
                        {
                            name: user.name,
                            userId: user._id
                        },
                        'secret',
                        {
                            expiresIn:"1h"
                        }
                    );
                    return res.status(200).json({
                        message: 'Auth succesfull',
                        token: token
                    });
                }
                res.status(401).json({
                    message: 'Auth failed'
                });
            });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({
                error:err
            });
        });
}

exports.users_update = (req,res,next)=>{
    const id = req.params.userId;
    bcrypt.hash(req.body.password,10,(err,hash)=> {
        if(err){
            return res.status(500).json({
                error: err
            });
        }
        else{
            User.update({_id: id},{$set: {password:hash}})
            .exec()
            .then(result => {
                res.status(200).json({
                    message: 'User updated'
                });
            })
            .catch(err =>{
                console.log(err);
                res.status(500).json({
                    error: err
                });
            });
           
        }
    });
    
}