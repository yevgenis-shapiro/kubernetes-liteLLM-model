
resource "helm_release" "redis" {
  name       = "redis"
  namespace  = kubernetes_namespace.litellm.metadata[0].name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"

  values = [yamlencode({
    architecture = "standalone"
    auth = { enabled = false }
  })]
}
