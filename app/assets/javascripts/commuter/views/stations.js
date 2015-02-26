Commuter.Views.Stations = Backbone.View.extend({
  template: 'commuter/templates/stations',
  el: '#commuter',

  initialize: function() {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var presenter = new Commuter.Presenters.Collection({
      collection: this.collection,
      modelPresenter: Commuter.Presenters.Station
    })

    this.$el.html(HoganTemplates[this.template].render(presenter))
  }
});
