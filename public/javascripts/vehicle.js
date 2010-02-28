var YearMakeModelSelector = Class.create({
	initialize: function(element) {
		this.element = element;
		
		this.makes_url  = this.element.getAttribute("data-makes_url");
		this.models_url = this.element.getAttribute("data-models_url");
		
		this.year_selector  = this.element.down(".year select");
		this.year_selector.observe("change", this.updateMakeSelector.bind(this));

		this.initializeMakeSelector();
		this.initializeModelSelector();
	},
	
	initializeMakeSelector: function() {
		this.make_selector  = this.element.down(".make select");
		this.make_selector.observe("change", this.updateModelSelector.bind(this));
	},
	
	initializeModelSelector: function() {
		this.model_selector = this.element.down(".model select");
	},
	
	updateMakeSelector: function() {
		new Ajax.Request(this.makes_url, {
			method: "get",
			parameters: { year: this.year_selector.getValue() },
			onSuccess: function(response) {
				this.make_selector.replace(response.responseText);
				this.initializeMakeSelector();
				this.updateModelSelector();
			}.bind(this)
		});
	},
	
	updateModelSelector: function() {
		new Ajax.Request(this.models_url, {
			method: "get",
			parameters: { year: this.year_selector.getValue(), make_id: this.make_selector.getValue() },
			onSuccess: function(response) {
				this.model_selector.replace(response.responseText);
				this.initializeModelSelector();
			}.bind(this)
		});
	}
});

document.observe("dom:loaded", function() {
	$$(".year_make_model_selector").each(function(element) {
		new YearMakeModelSelector(element);
	});
});