var http = require('http');
var os = require('os');
var url = require('url');
var moment = require('moment');

var quotes = [
  { movie: "Back to the Future", author: "Dr. Emmett Brown", text: "Roads? Where we're going we don't need... roads!" },
  { movie: "The Good, the Bad and the Ugly", author: "Tuco the Ugly", text: "When you have to shoot, shoot. Don't talk." },
  { movie: "The Good, the Bad and the Ugly", author: "The Good", text: "I'll sleep better knowing my good friend is by my side to protect me." },
];

function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

http.createServer(function (req, res) {
  var urlParts = url.parse(req.url).pathname;

  console.log("Request for: " + urlParts);

  if (urlParts == "" || urlParts == "/hc") {
    res.writeHead(204);
    res.end();
  } else if (urlParts == "/api/data") {
    var timeString = moment().format('YYYY-MM-DD HH:mm:ss');
    var quote = quotes[getRandomInt(quotes.length)];
    var hostname = os.hostname();

    res.writeHead(200, {'Content-Type': 'application/json'});

    var responseMessage = {
      time: timeString,
      quote: quote,
      hostname: hostname
    };

    res.end(JSON.stringify(responseMessage));
  } else {
    res.writeHead(404);
    res.end();
  }
}).listen(8080);