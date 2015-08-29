module.exports = handler;


function *handler(next) {
	try {
		yield next;
	} catch (err) {
		console.log(err);
		this.body = 'error';
	}
}
