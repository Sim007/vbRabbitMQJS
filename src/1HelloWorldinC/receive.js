#!/usr/bin/env node

var amqp = require('amqplib/callback_api');
const hostname = process.env.HOSTNAME;
console.log('env variable     : ' + process.env.HOSTNAME);
console.log('node.js variable : ' + hostname);
console.log(' ');

amqp.connect('amqp://' + hostname, function(err, conn) {
  conn.createChannel(function(err, ch) {
    var q = 'hello';

    ch.assertQueue(q, {durable: false});
    console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", q);
    ch.consume(q, function(msg) {
      console.log(" [x] Received %s", msg.content.toString());
    }, {noAck: true});
  });
});