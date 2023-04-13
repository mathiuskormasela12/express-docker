const express = require('express');
const fs = require('fs');
const dotenv = require('dotenv');

dotenv.config({ path: '.env' });

const app = express();

let index = 0;

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

app.get('/api/health', (req, res) => {
	if(index < 3) {
		index += 1;
		return res.json({
			message: 'Normal'
		})
	} else {
		return res.status(500).json({
			message: 'Failed'
		})
	}
});

app.listen(process.env?.PORT ?? 3000, () => {
	console.log(`Magic happen at ${process.env?.PORT ?? 3000}`);
});