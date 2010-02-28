var Duplicatable = Class.create({
  initialize: function(element) {
    this.element = element;
    this.add_link = element.down(".add");
    this.add_link.observe("click", this.add.bind(this));
    this.element.select(".duplicatable").each(function(duplicatable) {
      this.setup(duplicatable);
    }.bind(this));
  },
  
  add: function() {
    var clone = this.clone(this.element.select('.duplicatable').last());
    this.reset(clone);
    this.setup(clone);
    this.element.select('.duplicatable').last().insert({ after: clone });
  },
  
  clone: function(duplicatable) {
    var clone = duplicatable.cloneNode(true);
    var duplicatable_id = duplicatable.down("input[type=text], textarea, select").getAttribute("id").match(/_(\d+)_/)[1];
    var clone_id = parseInt(duplicatable_id) + 1;
    
    clone.select('input[type=text], textarea, select').each(function(input) {
      input.setAttribute("id", input.getAttribute("id").gsub("_" + duplicatable_id + "_", "_" + clone_id + "_"));
      input.setAttribute("name", input.getAttribute("name").gsub(/\[\d+\]/, "[" + clone_id + "]"));
    });
    
    clone.select('label').each(function(label) {
      var duplicatable_for = label.getAttribute("for");
      if(duplicatable_for) {
        label.setAttribute("for", duplicatable_for.gsub("_" + duplicatable_id + "_", "_" + clone_id + "_"));
      }
    });
    
    var delete_field = clone.down(".delete");
    if(delete_field) { delete_field.remove(); } 

    clone.show();
    
    return clone;
  },
  
  reset: function(duplicatable) {
    duplicatable.select('input[type=text], textarea').each(function(input) { input.value = ''; });
    duplicatable.select('select').each(function(input) { input.selectedIndex = 0; });
  },
  
  setup: function(duplicatable) {
    duplicatable.down(".remove").observe("click", this.remove.bind(this, duplicatable));   
  },
  
  remove: function(duplicatable) {
    var visible_duplicatables = this.element.select('.duplicatable').select(function(d) { return d.visible(); });
    
    var delete_field = duplicatable.down(".delete");
    if(delete_field) {
      delete_field.value = 1;
      duplicatable.hide();

      if(visible_duplicatables.size() == 1) { this.add(); }
    } else {
      if(visible_duplicatables.size() == 1) {
        this.reset(duplicatable);
      } else {
        duplicatable.remove();
      }
    }
  }
});

document.observe("dom:loaded", function() {
  $$(".duplicatables").each(function(element) {
    new Duplicatable(element);
  }); 
});