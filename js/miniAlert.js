// Generated by CoffeeScript 1.3.3
(function() {

  jQuery(function() {
    $.miniAlert = function(element, options) {
      var init, setState,
        _this = this;
      this.defaults = {
        message: 'hellow word',
        callback: function() {}
      };
      this.state = '';
      this.settings = {};
      this.$element = $(element);
      setState = function(state) {
        this.state = state;
      };
      this.getState = function() {
        return state;
      };
      this.getSetting = function(settingKey) {
        return this.settings[settingKey];
      };
      this.callSettingFunction = function(functionName, args) {
        if (args == null) {
          args = [];
        }
        return this.settings[functionName].apply(this, args);
      };
      init = function() {
        _this.settings = $.extend({}, _this.defaults, options);
        return _this.callSettingFunction('callback', [_this.$element, _this.getSetting('message')]);
      };
      init();
      return this;
    };
    return $.fn.miniAlert = function(options) {
      return this.each(function() {
        var plugin;
        if (void 0 === ($(this)).data('pluginName')) {
          plugin = new $.miniAlert(this, options);
          return ($(this)).data('miniAlert', plugin);
        }
      });
    };
  });

}).call(this);
