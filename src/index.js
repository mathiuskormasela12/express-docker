const express = require('express');
const fs = require('fs');
const dotenv = require('dotenv');

dotenv.config({ path: '.env' });

const app = express();

app.get('/api/hello', (req, res) => {
	const {name = ''} = req.query;

	if(name.length > 0) {
		fs.appendFile('data.txt', name, (err) => {
			if(err) {
				return res.send({
					message: err.message
				})
			};
			return res.send({
				message: 'File was created'
			});
		});
	} else {
		return res.send({
			message: 'Hi Express Js'
		})
	}
})

app.listen(process.env?.PORT ?? 3000, () => {
	console.log(`Magic happen at ${process.env?.PORT ?? 3000}`);
});