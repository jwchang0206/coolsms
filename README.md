CoolSMS-node
=====

---

## Installation

<pre>
  npm install coolsms
</pre>

or

<pre>
  git clone git://github.com/InspiredJW/coolsms.git
</pre>

## Usage

```javascript
var coolsms = require('coolsms');

coolsms({
  ssl: true,            // true | false
  user: 'username',     // CoolSMS username
  password: 'password', // CoolSMS password
  to: '01000000000',    // Recipient Phone Number
  from: '01000000000',  // Sender Phone Number
  text: 'Hello World!'  // Text to send
}, function(err, result) {
  // error message in String and result information in JSON
  if (err) {
    console.log(err);
  }
  console.log(body);
});

```

## 