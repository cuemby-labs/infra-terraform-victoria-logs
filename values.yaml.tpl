server:
  image:
    tag: ${victoria_logs_image}
  resources:
    limits:
      cpu: ${limits_cpu}
      memory: ${limits_memory}
    requests:
      cpu: ${request_cpu}
      memory: ${request_memory}
vector:
  env:
    - name: VECTOR_SELF_NODE_NAME
      valueFrom:
        fieldRef:
          fieldPath: spec.nodeName
  customConfig:
    api:
      enabled: false
      address: 127.0.0.1:8686
      playground: true