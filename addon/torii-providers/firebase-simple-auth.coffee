`import Ember from 'ember'`
`import ToriiFirebaseProvider from 'emberfire/torii-providers/firebase'`

FirebaseSimpleAuthProvider = ToriiFirebaseProvider.extend(
  fetch: (authData) ->
    return authData
)

`export default FirebaseSimpleAuthProvider`
