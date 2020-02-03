var fs = require("fs");
var os = require('os');
var http = require('http');
var moment = require('moment');

// parameters
const INTERVAL = process.env.INTERVAL; //in seconds
const OUTPUT_FOLDER='./output';

if (!fs.existsSync(OUTPUT_FOLDER)){
  fs.mkdirSync(OUTPUT_FOLDER);
}

var intervalMs = 10000;
if (INTERVAL != undefined) {
  intervalMs = INTERVAL * 1000;
} 

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write('Hello, my name is ' + os.hostname());
  res.end();
}).listen(8080);

function writeTimestamp() {
  var timeString = moment().format('YYYY-MM-DDTHH:mm:ss');
  fs.appendFile(OUTPUT_FOLDER + '/' + timeString + '.txt', 'Current timestamp on ' + os.hostname() + ': ' + timeString, function (err) {
    if (err) throw err;
    console.log('A new file has been created!');
  });
  setTimeout(writeTimestamp, intervalMs);
}

writeTimestamp();