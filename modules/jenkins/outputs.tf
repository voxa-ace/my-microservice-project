<<<<<<< HEAD
output "jenkins_url" {
  value = "http://<your-external-ip>:8080"
  description = "Jenkins web interface"
}

output "jenkins_admin_password" {
  value = "admin"
=======
output "jenkins_release_name" {
  value = helm_release.jenkins.name
}
output "jenkins_namespace" {
  value = helm_release.jenkins.namespace
>>>>>>> eb91a6e (Add full code for lesson-8-9)
}
