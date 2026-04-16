# 🌐 Terraform Azure Foundation

## 🇧🇷 Português

### 📌 Sobre

Este repositório contém a base de infraestrutura no Microsoft Azure utilizando Terraform.  
A ideia é organizar os principais componentes de rede, identidade e governança para servir como fundação para outros projetos.

---

### 🏗️ Estrutura

A infraestrutura está dividida em dois Resource Groups:

- **rg-foundation-connectivity** → rede (VNet e subnets)
- **rg-foundation-workload** → onde os recursos de aplicação serão provisionados no futuro

---

### ⚙️ O que está implementado

- Virtual Network com segmentação de subnets:
  - AKS
  - Banco de dados
  - Apps
- Grupos no Azure AD organizados por função
- Controle de acesso (RBAC) aplicado via grupos
- Padrão de naming baseado em `project` e `environment`
- Tags padronizadas para governança e FinOps

---

### 💰 Tags

Todos os recursos seguem um padrão de tags para facilitar organização e controle de custos:

- environment  
- owner  
- cost_center  
- id_orcamento  
- managed_by  
- business_unit  
- project

---

### ▶️ Como executar

```bash
terraform init
terraform plan
terraform apply
```

---

### 📌 Observações

Este repositório representa apenas a camada de foundation.
Recursos como AKS, banco de dados e integrações serão implementados em um repositório separado de workload.

---

## US English

### 📌 Overview

This repository contains a base infrastructure on Microsoft Azure using Terraform.
The goal is to organize networking, identity and governance components to serve as a foundation for other workloads.

---

### 🏗️ Structure

The infrastructure is split into two Resource Groups:

- **rg-foundation-connectivity** → networking (VNet and subnets)
- **rg-foundation-workload** → where application resources will be deployed in the future

---

### ⚙️ What is included

- Virtual Network with subnet segmentation:
  - AKS
  - Database
  - Apps
- Azure AD groups organized by role
- RBAC applied through groups
- Naming convention based on project and environment
- Standard tagging strategy for governance and FinOps

---

### 💰 Tags

All resources follow a standard tagging model for organization and cost management:

- environment
- owner
- cost_center
- id_orcamento
- managed_by
- business_unit
- project

---

### ▶️ How to use

```bash
terraform init
terraform plan
terraform apply
```

---

### 📌 Notes

This repository represents only the foundation layer.
Resources such as AKS, databases and integrations will be implemented in a separate workload repository.

---

Infrastructure as Code (IaC) on Azure using Terraform with focus on scalability, security and tagging FinOps.