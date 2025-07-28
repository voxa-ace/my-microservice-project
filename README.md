# DevOps Final Project on AWS

## Вимоги

🔧 Перед запуском переконайтеся, що у вас встановлено:

* `Terraform`
* `Helm`
* `kubectl`
* AWS CLI з налаштованим профілем

---

## Кроки виконання

### 1. Terraform

Ініціалізація:

```bash
terraform init
```

Перевірка:

```bash
terraform plan
```

Застосування:

```bash
terraform apply
```

> Це створить усю інфраструктуру: VPC, EKS, ECR, RDS, Jenkins, Argo CD, Prometheus, Grafana.

---

### 2. Docker: Завантаження Django-образу до ECR

```bash
docker build -t django_image:latest Django/
docker tag django_image:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:latest
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:latest
```

📌 Замініть `$AWS_ACCOUNT_ID`, `$AWS_REGION`, `$ECR_REPOSITORY` на ваші значення.

---

### 3. Helm: Деплой Django

```bash
cd charts/django-app
helm install my-django .
```

📌 `my-django` — довільне ім’я вашого Helm-релізу.

---

### 4. CI/CD через Jenkins

Jenkins автоматично запускає пайплайни на основі `Jenkinsfile` з Django-проєкту:

* Білд образу
* Пуш в ECR
* Оновлення Helm релізу через Argo CD

---

### 5. Argo CD

Перевірте статус деплоїв:

```bash
kubectl get applications -n argocd
```

Порт-форвардинг:

```bash
kubectl port-forward svc/argocd-server 8081:443 -n argocd
```

🔗 Відкрийте: [https://localhost:8081](https://localhost:8081)

---

### 6. Моніторинг через Grafana

```bash
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

 Відкрийте: [http://localhost:3000](http://localhost:3000)
 Логін/пароль: admin / admin (або виведіть через Helm output)

---

## Оновлення

Оновлення Helm-релізу:

```bash
helm upgrade my-django .
```

Оновлення Terraform:

```bash
terraform init -upgrade
terraform plan
terraform apply
```

---

## Видалення ресурсів

Видалення Helm-релізу:

```bash
helm uninstall my-django
```

Видалення інфраструктури:

```bash
terraform destroy
```

⚠️ Якщо робите "destroy", спочатку збережіть Terraform state, інакше буде втрачено дані бекенду (S3/DynamoDB).

---

## Terraform модулі

📁 `modules/` містить повторно використовувані частини інфраструктури:

* **s3-backend/** — бекенд для збереження стейтів
* **vpc/** — приватна/публічна VPC + NAT, IGW
* **ecr/** — Docker-репозиторій з автоскануванням
* **eks/** — кластер Kubernetes + EBS CSI драйвер
* **rds/** — RDS або Aurora DB, залежно від `use_aurora`
* **jenkins/** — Helm-деплой Jenkins
* **argo\_cd/** — Helm-деплой Argo CD + App chart
* **charts/django-app/** — Helm chart для Django

---

## Структура проєкту

```
Project/
├── main.tf
├── backend.tf
├── outputs.tf
├── modules/
│   ├── s3-backend/
│   ├── vpc/
│   ├── ecr/
│   ├── eks/
│   ├── rds/
│   ├── jenkins/
│   └── argo_cd/
├── charts/
│   └── django-app/
└── Django/
    ├── app/
    ├── Dockerfile
    ├── Jenkinsfile
    └── docker-compose.yaml
```

---

## Автор

**Volodymyr Kashnikov**
Фінальний проєкт курсу DevOps
