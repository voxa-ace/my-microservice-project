resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "jenkins" {
  name       = var.jenkins_release_name
  namespace  = var.namespace
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "4.5.0"
  values     = [file("${path.module}/values.yaml")]
  timeout    = 600
  force_update = true
  depends_on = [kubernetes_namespace.jenkins]
}
