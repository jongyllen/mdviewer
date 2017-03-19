var fs = require('fs');
var path = require('path');
var express = require('express');
var app = express();

app.use(express.static('public'))

app.get('/public/documents', function (req, res) {
  fs.readdir('public/documents', function (err, files)  {
    res.setHeader('Content-Type', 'application/json');

    var allFiles = [];
    files.forEach(function(file) {
      allFiles.push({"filename": file, "description": file});
    });

    res.send(allFiles);
  })
})

app.listen(3000, function () {
  console.log('App listening on port 3000!')
})
