Commuter.Router = Backbone.Router.extend({
  routes: {
    '': 'showStations',
    ':abbr': 'showStation'
  },

  showStations: function() {
    var view = new Commuter.Views.Stations({
      collection: Commuter.App.Repository.stations
    });

    view.render();
  },

  showStation: function(abbr) {
    var model = new Commuter.Models.Station({ id: abbr });
    var view = new Commuter.Views.Station({ model: model });
    model.fetch();
  }
});
