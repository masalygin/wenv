module.exports = handler;


function *handler(next) {
  try {
    yield next;
  } catch (err) {
    this.body = err;
    this.status = 404;
  }
}
