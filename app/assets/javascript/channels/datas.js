//= require action_cable

(function() {
    this.App || (this.App = {});
    App.cable = ActionCable.createConsumer();
}).call(this);

App.messages = App.cable.subscriptions.create('DatasChannel', {
    received: function(data) {
        return $('#restaurants').append(this.renderRestaurant(data));
    },

    renderRestaurant: function(data) {
        return `<ul>
              <li>${data.name}</li>
              <li>${data.city}</li>
            </ul>`;
    }
});