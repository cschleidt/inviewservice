import express from 'express';
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Handling non matching request from the client
app.use((req, res) => {
  res.status(404).send(
      "<h1>Page not found on the server</h1>")
})

app.listen(port, () => {
  return console.log(`Express is listening at http://localhost:${port}`);
});