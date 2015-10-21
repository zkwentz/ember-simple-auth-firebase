# Ember-simple-auth-firebase

Uses Firebase's [emberfire]() & [ember-simple-auth]() to allow you to easily
auth with Firebase.

## Installation

* `ember install emberfire`
* `ember install ember-simple-auth`
* `ember install ember-simple-auth-firebase`

##  Configuration

**config/environment.js**
```
module.exports = function(environment) {
  var ENV = {
    firebase: 'https://your-firebase-app.firebaseio.com/',
    torii: {
      sessionServiceName: 'session',
      providers: {
        'firebase-simple-auth': {
        }
      }
    },

    'ember-simple-auth': {
      authenticationRoute: 'sessions',
      routeAfterAuthentication: 'posts'
    }

  };
}
```

*Note: no configuration is required for `firebase-simple-auth` provider.*

## Usage

Assuming above, your session controller:

**app/controllers/session.js**
```
import Ember from 'ember';

SessionController = Ember.Controller.extend({
  session: Ember.inject.service(),
  actions: {
    authenticate: function authenticate(provider) {
      this.get('session').authenticate('authenticator:firebase-simple-auth','firebase-simple-auth',{
        provider: provider,
        email: this.get('email'),
        password: this.get('password')
      });
    }
  }
});

export default SessionController;
```

and your template would look something like the following:

**app/templates/session.hbs**
```
<h1>Login</h1>
<input value={{email}} type="text" placeholder="you@email.com" required>
<input value={{password}} type="password" placeholder="Password" required>
<button {[action 'authenticate' 'password'}}>Login</button>
```

*Note: the provider here is a bit different, it corresponds to Firebase's providers
that can be viewed on their [JS docs]()*

Your application route would look as normal, with ember-simple-auth.

**app/routes/application.js**
```
import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

ApplicationRoute = Ember.Route.extend(
  ApplicationRouteMixin,
  {
  }
);

export default ApplicationRoute;
```

as would your application controller.

**app/controllers/application.js**
```
import Ember from 'ember';

ApplicationController = Ember.Controller.extend({
  session: Ember.inject.service(),
  actions: {
    invalidateSession: function invalidateSession() {
      this.get('session').invalidate();
    }
  }
});

export default ApplicationController;
```


any route you wanted to require authentication on, you would do as normal 
as well:

**app/routes/posts/new.js**
```
import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

PostsNewRoute = Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function model(transition) {
    this.store.createRecord('post')
  }
});

export default PostsNewRoute;
```

And that's it.





