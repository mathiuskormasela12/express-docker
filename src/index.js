const express = require('express');
const dotenv = require('dotenv');

dotenv.config({ path: '.env' });

const app = express();

app.get('/api/hello', (req, res) => {
	return res.send({
		message: 'Hi Express Js'
	})
})

app.listen(process.env?.PORT ?? 3000, () => {
	console.log(`Magic happen at ${process.env?.PORT ?? 3000}`);
});