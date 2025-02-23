import radius as rad

param environment string

resource app 'Applications.Core/applications@2023-10-01-preview' = {
  name: 'myapp'
  properties: {
    environment: environment
  }
}

resource container 'Applications.Core/containers@2023-10-01-preview' = {
  name: 'mycontainer'
  properties: {
    application: app.id
    container: {
      image: 'ghcr.io/radius-project/samples/volumes:latest'
      volumes: {
        temp: {
          kind: 'ephemeral'
          managedStore: 'memory'
          mountPath: '/tmpdir'
        }
      }
    }
  }
}
