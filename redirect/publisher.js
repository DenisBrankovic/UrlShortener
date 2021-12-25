const amqp = require("amqplib");
const message = {number: 1};

async function connect(){
    try {
        const connection = await amqp.connect("amqp://localhost:5672"); 
        const channel = await connection.createChannel();
        const result = await channel.assertQueue("jobs");

        channel.sendToQueue("jobs", Buffer.from(JSON.stringify(message))); 
        console.log("Message number " + message.number); 
    } catch (ex) {
        console.error(ex); 
    }
}

connect(); 

//This function was initially supposed to get the newly created object from the API 
//and save it in the Redis database. Also, there would be a functionality of delivering 
//the new short url to the user. This was still just a general idea that was supposed to be
//worked out in detail when redis was there. However, as I was unable to properly install 
//Redis, the code that would do that is missing. There was also supposed to be
//a function that would receive an information in case of deleting an entry in the 
//mysql database and delete the same one in the Redis database. 