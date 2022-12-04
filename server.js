const express = require("express");
const mysql = require('mysql');
const app = express();
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })  
const PORT = process.env.PORT || 3306;
const cors = require("cors");

const corsOptions = {
    origin:"http://localhost:3000"
};

const db = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'semi9010~~',
    database: 'diary'
});

db.connect();

app.set('port', process.env.PORT || 3305);
app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.get('/api/diary/users', (req, res) => {
    db.query("SELECT * FROM users;", (err, result) => {
        if(!err){
            res.json(result);
        }else{
            console.log(err);
        } 
    })
});

//get a user id from db
app.get('/api/diary/users/user_id=:user_id', (req, res) => {
    db.query("SELECT * FROM users where user_id=\""+req.params.user_id+"\";", (err, result) => {
        if(!err){
            res.json(result);
        }else{
            console.log(err);
        } 
    })
});

//post a user
app.post('/api/diary/users/id=:id&profile=:profile&name=:name&addr1=:addr1&addr2=:addr2&email=:email', (req, res) => {
    db.query("UPDATE users SET img="+req.params.profile+" user_name="+req.params.name+" user_email="+req.params.email+" address_f="+req.params.addr1+" address_l="+req.params.addr2+" img= WHERE id="+re.params.id+";", (err, result) => {
        if(!err){
            res.json(result);
        }else{
            console.log(err);
        } 
    })
});

//update the specific profile by id of db
app.put('/api/diary/users', (req, res) => {
    db.query("UPDATE users SET img=\""+req.body.profile+"\", user_name=\""+req.body.name+"\", user_email=\""+req.body.email+"\", address_f=\""+req.body.address1+"\", address_l=\""+req.body.address2+"\" WHERE user_id=\""+req.body.user_id+"\";", (err, result) => {
        if(!err){
            res.json(result);
        }else{
            console.log(err);
        } 
    })
});

app.get('/api/diary/questions/id=:id', (req, res) => {
    db.query("SELECT * FROM questions WHERE user_id = \""+req.params.id+"\";", (err, result) => {
        if(!err){
            res.json(result);
        }else{
            console.log(err);
        } 
    })
});

app.listen(app.get('port'), () => {
    console.log('Server is on ' + app.get('port'));
})