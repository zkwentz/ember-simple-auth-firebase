`import ToriiAuthenticator from 'ember-simple-auth/authenticators/torii'`

FirebaseSimpleAuthAuthenticator = ToriiAuthenticator.extend(
  torii: Ember.inject.service('torii')
)

`export default FirebaseSimpleAuthAuthenticator`
