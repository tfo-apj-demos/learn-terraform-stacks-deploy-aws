exports.handler = async (event, context) => {
	const name = event.queryStringParameters?.name || 'World';

	return {
		statusCode: 200,
		headers: {
			'Content-Type': 'text/plain'
		},
		body: `Hello, ${name}!`
	};
};
