const express = require('express');
const router = express.Router();
const multer = require('multer');
const checkAuth = require('../middleware/check-auth');

const storage = multer.diskStorage({
    destination: function(req,file,cb){
        cb(null,'./uploads/');
    },
    filename: function(req,file,cb){
        cb(null,Date.now()+file.originalname);
    }
});
const fileFilter = (req,file,cb)=> {
    if(file.mimetype === 'image/jpeg'|| file.mimetype ==='image/png'){
        cb(null,true);
    }
    else{
        cb(null,false);
    }
};
const upload = multer({
    storage: storage, 
    limits:{
        fileSize: 1024*1024*5
    },
    fileFilter: fileFilter
});

const EventsController = require('../controllers/events');

router.get('/', EventsController.events_get_all);

router.post('/', checkAuth,upload.single('image'), EventsController.events_create);

router.get('/:productId',EventsController.events_get_one);

router.patch('/:productId', checkAuth,EventsController.events_update);

router.delete('/:productId', checkAuth,EventsController.Events_delete);

module.exports=router;