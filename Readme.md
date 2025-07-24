# Amazon Prime Clone — End-to-End DevOps Project (Terraform, Jenkins, SonarQube, Docker, EKS, ArgoCD, Prometheus & Grafana)

---

## 🚀 Overview

This project showcases a complete CI/CD and GitOps pipeline for deploying an **Amazon Prime clone web application** using best DevOps practices. It begins with infrastructure provisioning via **Terraform**, followed by CI/CD with **Jenkins**, code analysis with **SonarQube**, vulnerability scanning using **Trivy**, containerization via **Docker**, and orchestration on **Amazon EKS**. 

We use **ArgoCD** for GitOps-based deployments and **Prometheus + Grafana** for observability. Additional integrations include **Elastic IP** for static public access and **IAM roles/policies** for secure service interaction.

---

## 🏗️ Enhanced Architecture Diagram

![DevOps EKS Pipeline Architecture](https://raw.githubusercontent.com/HarideepDevOps/architecture/main/devops-eks-pipeline-architecture.png)

> This diagram displays all components including Terraform, Jenkins, Docker, ECR, EKS, ArgoCD, Prometheus, and Grafana in a real-world production setup.

---

## 🧰 Tools & Technologies Used

| Category              | Tools/Services                       |
|-----------------------|--------------------------------------|
| **IaC**               | Terraform                            |
| **CI/CD**             | Jenkins                              |
| **Code Quality**      | SonarQube                            |
| **Security Scanning** | Trivy                                |
| **Containerization**  | Docker                               |
| **Image Registry**    | Amazon ECR                           |
| **Orchestration**     | Amazon EKS (Kubernetes)              |
| **Deployment**        | ArgoCD                               |
| **Monitoring**        | Prometheus, Grafana                  |
| **IAM**               | Roles for EC2, Jenkins, ArgoCD, etc. |
| **Elastic IP**        | Static IP for Jenkins EC2 instance   |

---

## 📌 Project Workflow (Detailed Stage-wise Breakdown)

### 🟩 Stage 1: Infrastructure Setup with Terraform

- Provisioned **VPC, subnets, route tables, IGW, NAT**, and **security groups**.
- Created an EC2 instance with an **Elastic IP** to host Jenkins, SonarQube, and CLI tools.
- Installed all required dependencies using remote provisioning (`remote-exec`):
  - Java, Docker, Jenkins, AWS CLI, kubectl, Helm, SonarQube, Trivy, etc.
- Attached IAM Role with necessary permissions (ECR, EKS, CloudWatch).

---

### 🟦 Stage 2: CI/CD Pipeline with Jenkins

- Jenkins pipeline configured with parameters and credentials for AWS.
- **Steps:**
  1. Clone app source code from GitHub.
  2. Run **SonarQube** for static code analysis.
  3. Run `npm install` and build project.
  4. Scan the Docker image using **Trivy**.
  5. Build Docker image and push to **Amazon ECR**.

---

### 🟨 Stage 3: EKS Cluster Provisioning

- Created Amazon EKS cluster and node group using Terraform.
- Used `aws eks update-kubeconfig` to configure local kube context.
- Verified with `kubectl get nodes`.

---

### 🟧 Stage 4: Monitoring with Prometheus & Grafana

- Added **prometheus-community** and **stable** Helm repos.
- Installed **kube-prometheus-stack** via Helm.
- Patched Prometheus and Grafana services to type `LoadBalancer`.
- Exposed dashboards:
  - Prometheus UI
  - Grafana dashboard (default user: `admin`, password from Kubernetes secret)

---

### 🟥 Stage 5: GitOps Deployment using ArgoCD

- Installed ArgoCD via official manifest in its own namespace.
- Patched ArgoCD service to `LoadBalancer` to access UI externally.
- Logged into ArgoCD, added GitHub repo and EKS cluster.
- Synced the application from the manifest files stored in GitHub.
- Application deployed automatically upon changes in GitHub repo.

---

## 📊 Observability Dashboards

### 📈 Grafana
- Dashboards include:
  - Node CPU & Memory
  - Pod resource consumption
  - EKS cluster health

### 📡 Prometheus
- Scrapes metrics from:
  - kube-state-metrics
  - node-exporter
  - kubelet
- Preconfigured with alerting rules and time-series queries.

---

## 🔐 Security Considerations

- **IAM Role Attachments**: Fine-grained access using IAM policies to control EC2, EKS, and ECR.
- **Elastic IP Usage**: Enables fixed public IP to access Jenkins server securely.
- **SonarQube Integration**: Ensures secure, clean, and reliable code via static analysis.
- **Trivy Scanning**: Detects known vulnerabilities in Docker images before deployment.

---

## ✅ Final Deliverables

- 🔧 Full Infrastructure-as-Code setup via Terraform
- 🧪 Jenkins-based CI/CD pipeline
- 📦 Secure Docker image stored in ECR
- ☸️ Kubernetes deployment on Amazon EKS
- 🚀 GitOps-based deployment via ArgoCD
- 📊 Real-time cluster monitoring using Prometheus & Grafana

---

## 👨‍💻 Author

**Harideep Janga**  
DevOps Practitioner | AWS | Kubernetes | Terraform | CI/CD Enthusiast  
📧 [Reach me via GitHub](https://github.com/HarideepDevOps)

---

