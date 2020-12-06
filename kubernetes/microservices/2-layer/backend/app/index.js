var http = require('http');
var os = require('os');
var url = require('url');
var moment = require('moment');

http.createServer(function (req, res) {
  var urlParts = url.parse(req.url).pathname;

  console.log("Request for: " + urlParts);

  if (urlParts == "" || urlParts == "/hc") {
    res.writeHead(204);
    res.end();
  } else if (urlParts == "/api/data") {
    var timeString = moment().format('YYYY-MM-DD HH:mm:ss');
    var envValue = process.env.KZ_ENV; // reads the environment variable KZ_ENV
    var hostname = os.hostname();

    res.writeHead(200, {'Content-Type': 'application/json'});

    var responseMessage = {
      time: timeString,
      env: envValue,
      hostname: hostname
    };

    res.end(JSON.stringify(responseMessage));
  } else {
    res.writeHead(404);
    res.end();
  }
}).listen(8080);