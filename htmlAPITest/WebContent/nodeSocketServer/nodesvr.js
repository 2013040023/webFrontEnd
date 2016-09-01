var WebSocketServer = require('websocket').server;
var http = require('http');
var server = http.createServer( reqResp );
server.listen(9090, listenFn );

var clients = [];

wsServer = new WebSocketServer( {httpServer: server, autoAcceptConnections: false} );
wsServer.on('request', Request );
 
 
function reqResp(request, response) 
{
  	console.log((new Date()) + '---> Received request for ' + request.url);
	response.writeHead(404);
 	response.end();
}
 
function listenFn()
{
	console.log((new Date()) + ' Server is listening on port 9090');	
}
// { 1: connection ,2:connection, 3: connection..} 
function Request(request)
{
    connection = request.accept(null, request.origin);
	connection.chatId = clients.length+1;
	clients.push(connection);

    
    console.log((new Date()) + ' Connection accepted.');
    connection.on('message', ReceivedMessage);
    connection.on('close', CloseEvent);
}
 
function ReceivedMessage(message)
{
     console.log('Received Message: ' + message.utf8Data);
     //obj = {name:"임꺽정", age:50};
     //connection.sendUTF( JSON.stringify(obj) );
    // for( i=0; i< clients.length; i++)
     for( n in clients)
     {
    	 clients[n].sendUTF(connection.chatId +'번:'+message.utf8Data)
     }
}

 
function CloseEvent(reasonCode, description)
{
	clients.splice(clients.indexOf(connection),1);
	
    for( n in clients)
    {
    	clients[n].sendUTF(connection.chatId +'번 나감:'+message.utf8Data)
    }
    
    
    console.log( (new Date()) + ' Peer ' + connection.remoteAddress + ' disconnected.');
}
 