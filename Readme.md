# Amazon Prime Clone — End-to-End DevOps Project (Terraform, Jenkins, SonarQube, Docker, EKS, ArgoCD, Prometheus & Grafana)

---

## 🚀 Overview
This project demonstrates an end-to-end DevOps pipeline for a sample Amazon Prime clone web application. It covers Infrastructure provisioning with **Terraform**, CI/CD with **Jenkins**, containerization with **Docker**, container registry via **ECR**, orchestration using **Amazon EKS (Kubernetes)**, and observability with **Prometheus + Grafana**. Application deployment is managed using **ArgoCD** for GitOps-style delivery.

---

## 🏗️ Architecture Diagram

```
                         ┌──────────────────────────────┐
                         │          Developers           │
                         └─────────────┬────────────────┘
                                       │
                             GitHub Repository (App Code)
                                       │
                      ┌────────────────▼────────────────┐
                      │          Jenkins (CI/CD)         │
                      └────────────────┬────────────────┘
                                       │
                ┌─────────────────────▼─────────────────────┐
                │        SonarQube (Code Quality Check)      │
                └─────────────────────┬─────────────────────┘
                                       │
                            ┌─────────▼────────┐
                            │  Trivy (Scanner) │
                            └─────────┬────────┘
                                      │
                             ┌────────▼─────────┐
                             │ Docker Build &    │
                             │ Push to ECR       │
                             └────────┬──────────┘
                                      │
                         ┌────────────▼────────────┐
                         │       Amazon ECR        │
                         └────────────┬────────────┘
                                      │
                      ┌───────────────▼────────────────┐
                      │        Amazon EKS (K8s)         │
                      └───────────────┬────────────────┘
                                      │
                         ┌────────────▼────────────┐
                         │         ArgoCD          │
                         └────────────┬────────────┘
                                      │
                         ┌────────────▼────────────┐
                         │   Web Application PODs   │
                         └────────────┬────────────┘
                                      │
                         ┌────────────▼────────────┐
                         │ Prometheus + Grafana     │
                         │   (Monitoring & Metrics) │
                         └──────────────────────────┘
```

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

---

## 📌 Project Workflow (Stage by Stage)

### **Stage 1: Infrastructure Setup with Terraform**
- Provisioned an EC2 instance using Terraform.
- Opened necessary security groups (ports for Jenkins, SonarQube, ArgoCD, etc.).
- Installed essential DevOps tools (Jenkins, Node.js, SonarQube, Docker, AWS CLI, etc.).

### **Stage 2: CI Pipeline using Jenkins**
1. Cloned the source code from GitHub.
2. Analyzed code quality using **SonarQube**.
3. Installed dependencies and built the app using **npm**.
4. Performed image vulnerability scanning using **Trivy**.
5. Built Docker image and pushed it to **Amazon ECR**.

### **Stage 3: Kubernetes Cluster Provisioning**
- Created an **Amazon EKS** cluster using Terraform.
- Configured `kubectl` to connect with the EKS cluster.

### **Stage 4: Monitoring Setup**
- Installed **Prometheus & Grafana** via Helm charts in the `prometheus` namespace.
- Exposed Prometheus and Grafana using LoadBalancers.
- Verified real-time metrics and CPU/memory monitoring.

### **Stage 5: ArgoCD Setup and Deployment**
- Installed **ArgoCD** in the `argocd` namespace.
- Exposed the ArgoCD server via LoadBalancer.
- Connected our EKS cluster to ArgoCD.
- Created Kubernetes manifests (`Deployment`, `Service`) for the app using ECR image.
- Synced the GitHub repo with ArgoCD and successfully deployed.

### **Final Output:**
- Application successfully deployed and accessible via LoadBalancer.
- Real-time monitoring available through **Grafana dashboards**.
- GitOps deployment and re-deployment managed through **ArgoCD UI**.

---

## 📝 Folder Structure (Jenkins Host)
```bash
.
├── Dockerfile
├── Jenkinsfile
├── sonar-project.properties
├── terraform/
│   ├── ec2.tf
│   ├── eks-cluster.tf
│   ├── outputs.tf
│   └── variables.tf
└── k8s/
    ├── deployment.yaml
    └── service.yaml
```

---

## 📊 Observability Dashboards
- **Grafana Dashboards:**
  - Cluster health
  - Node CPU/Memory
  - Pod-level metrics
- **Prometheus Metrics:**
  - Scraped from K8s nodes, kube-state-metrics
  - AlertManager can be optionally integrated

---

## 🔐 Security Considerations
- AWS credentials stored using Jenkins credentials plugin
- Trivy used for image vulnerability scanning
- SonarQube for code-level issues

---

## ✅ Outcome
✅ Successfully built and deployed a microservice-based web application on Kubernetes using modern DevOps practices.  
✅ Fully automated from code to deployment using CI/CD pipelines and GitOps.  
✅ Application metrics visible in real-time for performance monitoring.

---

## 👨‍💻 Author
**Harideep Janga**  
DevOps Enthusiast | First DevOps Project using Terraform, Jenkins & Kubernetes

Feel free to ⭐ this repository and connect with me for suggestions!
