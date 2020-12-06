const express = require('express');
const cors = require('cors')
const app = express();

app.use(cors());


const PORT = process.env.PORT || 5000;


app.get('/hello',  (req, res) => {
    res.send('HelloWorld')
});

app.listen(PORT, () => {
    console.log(`Listening on port: ${PORT}`);
});