Commuter.Router = Backbone.Router.extend({
  routes: {
    '': 'showStations',
    ':abbr': 'showStation'
  },

  showStations: function() {
    var collection = new Commuter.Collections.Stations();
    var view = new Commuter.Views.Stations({ collection: collection });
    collection.fetch();
  },

  showStation: function(abbr) {
    var model = new Commuter.Models.Station({ id: abbr });
    var view = new Commuter.Views.Station({ model: model });
    model.fetch();
  }
});
