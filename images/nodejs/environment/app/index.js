var http = require('http');
var os = require('os');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  
  var replyText = '<h1>Hello</h1>';
  replyText += '<p>My hostname is ' + os.hostname() + '</p>';
  replyText += '<p>You are running on the environment ' + process.env.KZ_ENV + '</p>';

  res.write(replyText);
  res.end();
}).listen(8080);