var target = "https://www.livescore.com"; 
var shortOne = "/abc";

/*This code creates a web server. It listens on port 8080 and when
 a short url is entered in the browser at localhost:8080/whateverShortUrl it redirects 
 to the long url location. The variables shortOne and target 
 were supposed to be assigned the values from Redis once I installed it
 and had it working, which I never did.
 I just created hard coded dummy values for the purpose of testing the code.*/

const http = require("http");

const server = http.createServer(function (req, res) {
    const url = req.url;
    if (url === "/") { 
        res.writeHead(200, { "Content-Type": "text/html" });
        res.write("<h1 style='text-align: center; margin-top: 20vh'>Url Shortener<h1>");
        res.end();
      } else if (url === shortOne) {
        res.writeHead(302, {
          location: target,
        });
        res.end();
      } else {
        res.writeHead(404);
        res.write("<h1>Not found<h1>");
        res.end();
      }
    
  });

server.listen(8080, function () {
  console.log("server started at port 8080");
});