var fs = require('fs');
var path = require('path');

module.exports.replace = {

	'*': {
		'{$common_js}': fs.readFileSync(path.join(__dirname, 'resources/templates/common_js.tpl'))
	},

	'get': {
		mode: {
			cart: {
				'{tpl.body}': '{include file="global:cart.tpl"}'
			},
			folder: {
				'{tpl.body}': '{include file="global:folder.tpl"}'
			},
			product: {
				'{tpl.body}': '{include file="global:product.tpl"}'
			},
			order: {
				'{tpl.body}': '{include file="global:order.tpl"}'
			}
		}
	},

	smarty: [
		'if',
		'foreach',
		'capture',
		'section',
		'literal',
		'strip',
		'else',
		'elseif',
		'foreachelse',
		'sectionelse'
	]

};