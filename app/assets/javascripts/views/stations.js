Commuter.Views.Stations = Backbone.View.extend({
  template: 'stations',
  el: '#commuter',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    this.$el.html(HoganTemplates[this.template].render(this.collection))
  }
});
