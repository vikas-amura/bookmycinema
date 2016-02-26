class Bookmycinema.Models.Entry extends Backbone.Model
	parse: (resp, options) ->
		resp.id = resp._id["$oid"]
		delete resp._id
		resp