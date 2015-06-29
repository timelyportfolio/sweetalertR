HTMLWidgets.widget({

  name: 'sweetalert',

  type: 'output',

  initialize: function(el, width, height) {

    return { }

  },

  renderValue: function(el, x, instance) {
    //  if a selector is provided then bind sweetalert to an event
    if (x.selector !== null){
      Array.prototype.forEach.call(
        document.querySelectorAll(x.selector)
        ,function(el){
          el[x.event] = function(){sweetAlert(x.options);}
        }
      )
    } else {
      sweetAlert(x.options);
    }

  },

  resize: function(el, width, height, instance) {

  }

});
