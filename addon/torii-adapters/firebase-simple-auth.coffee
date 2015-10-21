`import Ember from 'ember'`
`import ToriiFirebaseAdapter from 'emberfire/torii-adapters/firebase'`

FirebaseSimpleAuthAdapter = ToriiFirebaseAdapter.extend(
  firebase: Ember.inject.service()
)

`export default FirebaseSimpleAuthAdapter`
