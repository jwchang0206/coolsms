crypto = require "crypto"
request = require "request"
_ = require "underscore"

module.exports = (input, callback) ->
	options =
		uri: '//api.coolsms.co.kr/sendmsg'
		ssl: false
		user: 'user'
		password: 'password'
		enc: 'md5'
		to: ''
		from: ''
		text: ''
	
	options = _.extend options, input
	
	options.password = crypto
	.createHash(options.enc)
	.update(options.password)
	.digest("hex")
	
	request.post
		uri: (if options.ssl then "https:" else "http:") + options.uri
		form:
			user: options.user
			password: options.password
			enc: options.enc
			to: options.to
			from: options.from
			text: options.text
	, (err, res, body) ->
		messages = {}
		lines = body.split '\n'
		for line in lines
			part = line.split '='
			messages[part[0]] = part[1] if part[0].trim().length > 0
		
		callback err, messages