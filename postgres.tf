
resource "helm_release" "postgres" {
  name       = "postgres"
  namespace  = kubernetes_namespace.litellm.metadata[0].name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"

  values = [yamlencode({
    auth = {
      username = "litellm"
      password = "litellm"
      database = "litellm"
    }
  })]
}
