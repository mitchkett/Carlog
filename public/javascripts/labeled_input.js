LabeledInput = Class.create({
  initialize: function(element) {
    this.element = element
    this.element.observe("focus", this.clear.bind(this));
    this.element.observe("blur", this.insert.bind(this));

    this.insert();
  },

  clear: function() {
    if(this.element.value == this.element.getAttribute("label")) {
      this.element.clear();
      this.element.removeClassName("blank");
    }
  },

  insert: function() {
    if (this.element.value.blank()) { 
      this.element.value = this.element.getAttribute("label"); 
      this.element.addClassName("blank");
    }
  },
  
  reset: function() {
    this.clear();
    this.insert();
  }
});

LabeledInput.initialize = function() {
  $$("form").each(function(element) {
    element.observe("submit", LabeledInput.clear.bind(this, element));
  });

  $$('input[label],textarea[label]').each(function(element) {
    if(!element.labeled_input) {
      var labeled_input = new LabeledInput(element);
      element.labeled_input = labeled_input;
    }
  });
}

LabeledInput.clear = function(form) {
  form.select('*[label]').each(function(element) {
    element.labeled_input.clear();
  });
}

document.observe("dom:loaded", function() {
  LabeledInput.initialize();
});