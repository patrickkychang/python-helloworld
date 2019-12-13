{
  "apiVersion": "extensions/v1beta1",
  "kind": "Deployment",
  "metadata": {
    "name": "catalogue",
    "labels": {
      "name": "catalogue"
    },
    "namespace": "sock-shop"
  },
  "spec": {
    "replicas": 1,
    "template": {
      "metadata": {
        "labels": {
          "name": "catalogue"
        }
      },
      "spec": {
        "hostIPC": true,
        "containers": [
          {
            "name": "catalogue",
            "image": "weaveworksdemos/catalogue:0.3.5",
            "env": [
              {
                "name": "ZIPKIN",
                "value": "http://zipkin.zipkin.svc.cluster.local:9411/api/v1/spans"
              }
            ],
            "ports": [
              {
                "containerPort": 80
              }
            ],
            "securityContext": {
              "runAsNonRoot": false,
              "runAsUser": 10001,
              "capabilities": {
                "drop": [
                  "all"
                ],
                "add": [
                  "NET_BIND_SERVICE"
                ]
              },
              "readOnlyRootFilesystem": true
            }
          }
        ]
      }
    }
  }
}
