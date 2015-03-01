Commuter.Views.Station = Backbone.View.extend({
  template: 'commuter/templates/station',
  el: '#commuter',

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var presenter = new Commuter.Presenters.Station({
      model: this.model
    })

    this.$el.html(HoganTemplates[this.template].render(presenter))
  }
});
