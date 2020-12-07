const express = require('express');
const cors = require('cors')
const app = express();
const mineCMDS = require('mine.lua')

app.use(cors());


const PORT = process.env.PORT || 5000;


app.get('/hello',  (req, res) => {
    res.send('HelloWorld')
});

app.get('/mine', (req, res) => {
    res.send(mineCMDS)
})

app.listen(PORT, () => {
    console.log(`Listening on port: ${PORT}`);
});