# Amazon Prime Clone — End-to-End DevOps Project (Terraform, Jenkins, SonarQube, Docker, EKS, ArgoCD, Prometheus & Grafana)

---

## 🚀 Overview
This project demonstrates a complete DevOps lifecycle implementation for a sample Amazon Prime clone web application. It begins with Infrastructure provisioning via **Terraform**, followed by building CI/CD pipelines using **Jenkins**, incorporating **SonarQube** for static code analysis, **Trivy** for security scanning, **Docker** for containerization, **ECR** for image hosting, and **Amazon EKS** (Kubernetes) for orchestration. Deployment is handled through **ArgoCD**, and observability is achieved using **Prometheus** and **Grafana**.

This project also makes use of **Elastic IPs**, **IAM roles and policies**, and **LoadBalancers** for external access.

---

## 🏗️ Enhanced Architecture Diagram

![DevOps EKS Pipeline Architecture](https://raw.githubusercontent.com/HarideepDevOps/architecture/main/devops-eks-pipeline-architecture.png)

> _(This image includes Jenkins, SonarQube, Trivy, Docker, ECR, EKS, ArgoCD, Prometheus, and Grafana with colored components and clear technology flow)_

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
| **IAM**               | Roles for Jenkins, ArgoCD, EKS, etc. |
| **Elastic IP**        | Static IP for Jenkins EC2            |

---

## 📌 Project Workflow (Detailed Stage-wise Breakdown)

### **Stage 1: Infrastructure Setup with Terraform**
- **EC2 Creation**: Provisioned EC2 with Elastic IP for Jenkins, SonarQube, and other tools.
- **Security Groups**: Opened custom ports (8080, 9000, 3000, etc.).
- **Installed Dependencies**: Jenkins, Node.js, Docker, AWS CLI, SonarQube, Trivy, etc.
- **IAM Attachments**: IAM roles with policies for EC2 and EKS interaction.

### **Stage 2: CI/CD Pipeline in Jenkins**
1. Clone source code from GitHub.
2. Perform **SonarQube** static code analysis.
3. Run `npm install` and `npm run build`.
4. Scan Docker image using **Trivy**.
5. Build Docker image and push to **Amazon ECR**.

### **Stage 3: EKS Setup and Configuration**
- Provisioned **Amazon EKS cluster** using Terraform.
- Configured `kubectl` using `aws eks update-kubeconfig`.
- Deployed test pod to validate connection.

### **Stage 4: Monitoring Setup (Prometheus + Grafana)**
- Installed using **Helm charts** in `monitoring` namespace.
- Exposed via LoadBalancer services.
- Dashboards configured in Grafana for CPU, memory, and pod metrics.

### **Stage 5: GitOps Deployment with ArgoCD**
- Installed ArgoCD in the `argocd` namespace.
- ArgoCD server exposed via LoadBalancer.
- Connected EKS cluster to ArgoCD and GitHub repo.
- Deployed application using K8s manifests and synced.

### ✅ Final Output:
- Frontend available via EKS LoadBalancer.
- ArgoCD UI accessible to control GitOps deployments.
- Live monitoring via Grafana Dashboards.

---

## 📊 Observability Dashboards
- **Grafana Dashboards:**
  - Cluster CPU/Memory
  - Node health & status
  - Pod resource consumption
- **Prometheus Metrics:**
  - Scraped from `kube-state-metrics`, `node-exporter`
  - Pre-configured alerts and graphs

---

## 🔐 Security Considerations
- **IAM Roles & Policies**: Attached to EC2 and EKS nodes.
- **Static Elastic IP**: Ensures consistent access to Jenkins and ArgoCD.
- **SonarQube**: For code-level bugs, vulnerabilities, and smells.
- **Trivy**: For container vulnerability scanning before pushing to registry.

---

## ✅ Project Outcome
- 🚀 Full CI/CD & GitOps pipeline up and running.
- 🐳 Dockerized application deployed to Amazon EKS.
- 📈 Real-time monitoring integrated.
- 🔁 Git-based deployment automation through ArgoCD.

---

## 👨‍💻 Author
**Harideep Janga**  
DevOps Enthusiast | Terraform | Jenkins | Kubernetes | AWS

Feel free to ⭐ this project or reach out for collaboration or feedback!
