var http = require('http');
var os = require('os');
var moment = require('moment');

var port = 8080;

http.createServer(function (req, res) {
  var timeString = moment().format('YYYY-MM-DDTHH:mm:ss');

  console.log(timeString + " Hey, I have a request!");

  res.writeHead(200, {'Content-Type': 'text/html'});
  
  var replyText = '<h1>Hello</h1>';
  replyText += '<p>My hostname is ' + os.hostname() + '</p>';
  replyText += '[' + timeString + ']';

  res.write(replyText);
  res.end();
}).listen(port);

console.log("I'm listening on port " + port);