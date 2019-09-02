#!/usr/bin/env node

var amqp = require('amqplib/callback_api');
const hostname = process.env.HOSTNAME;
console.log('hostname variable: ' + hostname);
console.log('env variable     : ' + process.env.HOSTNAME);
console.log(' ');


//amqp.connect('amqp://172.17.0.2', function(err, conn) {
amqp.connect('amqp://'+ hostname, function(err, conn) {
  conn.createChannel(function(err, ch) {
    var q = 'hello';
    var msg = 'Hello World!';

    ch.assertQueue(q, {durable: false});
    ch.sendToQueue(q, Buffer.from(msg));
    console.log(" [x] Sent %s", msg);
  });
  setTimeout(function() { conn.close(); process.exit(0) }, 500);
});