import express from 'express';

const app = express();

const port = process.env.PORT || 3000;

app.get('/api', (req, res) => {
    res.send({
        status: 0
    })
});

app.get('/test', (req, res) => {
    res.send({
        status: 1
    })
});

app.use((req, res) => {
    res.status(404).send("Not found");
});

app.listen(port, () => {
    console.log("Listening at ", port)
});
