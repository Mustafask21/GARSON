
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Garson Backend API Çalışıyor!');
});

app.listen(port, () => {
  console.log(`Backend API listening on port ${port}`);
});
