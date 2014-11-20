module.exports.replace = {

	'*': {

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
	}

};