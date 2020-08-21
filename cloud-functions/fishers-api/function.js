const { Datastore } = require('@google-cloud/datastore');
const express = require('express');
const app = express();

const datastore = new Datastore({
	projectId: 'fishtainable',
	keyFilename: 'datastore-credential.json'
});

app.get('/list', (req, res) => {
	const kindName = "fishers";
	const parent = "consolidators";
	let id = parseInt(req.query.parent_id);
	// let id = 5634161670881280;
	
	const ancestorKey = datastore.key([parent, id]);
	const query = datastore.createQuery(kindName)
		.select(['__key__','fullname','profilepic'])
		.hasAncestor(ancestorKey);
	
	query.run().then(function(data) {
		var result = [];
		data[0].forEach((v, i) => {
			result.push({
				'fullname': data[0][i]['fullname'],
				'key': data[0][i][datastore.KEY]['id'],
				'profilepic': data[0][i]['profilepic']
			});
		});
		res.status(200).send(result);
	});
});

exports.fishers = app;