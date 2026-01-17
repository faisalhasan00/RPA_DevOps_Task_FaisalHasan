# RPA DevOps Automation Setup - Automation Anywhere A360

## Overview

This project demonstrates a comprehensive DevOps automation framework for RPA (Robotic Process Automation) deployments using Automation Anywhere A360. Since no Azure access is available, this is a **fully simulated implementation** that shows the complete CI/CD workflow without any actual cloud resources.

**Important**: This solution runs entirely on your local machine. No Azure resources are provisioned, no Azure DevOps pipelines are executed, and no Automation Anywhere connections are made. Everything is simulated for demonstration purposes.

## Architecture

### High-Level Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Source Code   │───▶│   CI/CD Pipeline │───▶│  Deployments    │
│   (Git)         │    │   (Definition)   │    │  (Simulated)    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│ Infrastructure  │    │   Agents         │    │   Monitoring    │
│ (Simulated)     │    │   (YAML/JSON)    │    │   & Logging     │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

### Infrastructure Components (Simulated)

The infrastructure components are **defined in Terraform** but **simulated locally** - no actual Azure resources are created:

- **Resource Group**: Mock container for RPA resources
- **Storage Account**: Local artifact storage simulation
- **Key Vault**: Environment variable-based secrets simulation
- **Virtual Network**: Network configuration simulation
- **Windows VM**: Bot runner environment simulation
- **Network Interface**: Connectivity simulation

All components exist only as local state files and console output.

### Project Structure

```
rpa-devops-automation/
├── infrastructure/           # Terraform configurations
│   ├── main.tf              # Main infrastructure definition
│   ├── variables.tf         # Input variables
│   └── outputs.tf           # Output values
├── pipelines/               # CI/CD pipeline definitions
│   └── azure-pipelines.yml  # Azure DevOps pipeline
├── bots/                    # RPA bot artifacts
│   └── Sample_Bot/
│       ├── bot.json         # Bot definition with versioning
│       └── README.md        # Bot documentation
├── configs/                 # Deployment configurations
│   ├── dev.yaml            # Development environment settings
│   ├── test.yaml           # Test environment settings
│   └── prod.yaml           # Production environment settings
├── environments/            # Environment metadata
│   ├── dev.yaml            # Dev environment description
│   ├── test.yaml           # Test environment description
│   └── prod.yaml           # Prod environment description
├── agents/                  # Intelligent agents
│   ├── deployment_agent.yaml # Deployment decisions
│   └── infra_health_agent.yaml # Health monitoring
├── scripts/                 # Automation scripts
│   ├── deploy_bot.sh       # Bot deployment with versioning
│   ├── validate_bot.sh     # Validation checks
│   ├── rollback_bot.sh     # Rollback operations
└── README.md               # This file
```

## CI/CD Flow (Simulated)

### Pipeline Definition

The `pipelines/azure-pipelines.yml` file defines how a real CI/CD pipeline **would work** in Azure DevOps. Since we don't have Azure DevOps access, these stages are demonstrated through local scripts:

1. **Source Control & Trigger**
   - Git-based version control (simulated)
   - Would trigger on main branch changes
   - Monitors paths: bots/, configs/, environments/

2. **Build & Validation**
   - Bot package validation via `validate_bot.sh`
   - Version extraction from bot.json
   - Local artifact preparation

3. **Deploy to Development**
   - Automated deployment via `deploy_bot.sh dev`
   - Basic validation and health checks
   - No manual approval required

4. **Deploy to Test**
   - Automated deployment via `deploy_bot.sh test`
   - Integration testing execution
   - Post-deployment validation

5. **Deploy to Production**
   - Manual approval simulation in pipeline YAML
   - Full deployment via `deploy_bot.sh prod`
   - Production environment validation

6. **Rollback (Conditional)**
   - Automatic rollback on failures
   - Manual rollback via `rollback_bot.sh`
   - Version-based artifact restoration

### Deployment Strategy

#### Environment Progression
```
Development ──▶ Testing ──▶ Production
     │              │            │
   Auto-deploy   Integration   Manual
   Validation    Tests       Approval
```

#### Multi-Environment Support
- **Development**: Rapid iteration and testing
- **Testing**: Integration testing and QA validation
- **Production**: Live environment with manual approval

#### Secrets Management
- Environment variables for sensitive data
- Key Vault integration comments for production
- Separate secrets per environment

## Automation Anywhere Platform Integration (Simulated)

### API Integration Pattern

The deployment scripts **demonstrate** the API interaction pattern that would be used with Automation Anywhere A360:

```bash
# Simulated API calls (would be real HTTP requests)
# Authentication
POST /v1/authentication
# Bot Upload
POST /v2/blm/upload
# Deployment
POST /v1/botdeployment
# Status Monitoring
GET /v1/botdeployment/status
```

### Bot Package Structure

```json
{
  "botName": "Sample_RPA_Bot",
  "version": "1.0.0",
  "description": "Sample Automation Anywhere bot for CI/CD simulation",
  "steps": [
    "Open Application",
    "Login",
    "Process Data",
    "Logout"
  ]
}
```

### Environment-Based Deployment Concept

- **Environment-specific URLs**: Different Control Room URLs per environment
- **Separate credentials**: Environment-specific API keys
- **Configuration-driven**: Settings loaded from YAML files

## Intelligent Agents

### Deployment Decision Agent

**Purpose**: Automatically evaluates deployment readiness

**Decision Criteria**:
- Test execution results
- Manual approval status
- Infrastructure health metrics

**Configuration**: `agents/deployment_agent.yaml`

### Infrastructure Health Agent

**Purpose**: Monitors infrastructure components and provides recommendations

**Monitoring Areas**:
- Resource utilization
- Service availability
- Performance metrics
- Error rates

**Configuration**: `agents/infra_health_agent.yaml`

## Monitoring & Logging (Simulated)

### Log Types (Local Files)

1. **Script Execution Logs**: Console output from bash scripts
2. **Deployment Logs**: Local log files created by deployment scripts
3. **Infrastructure Logs**: Simulated provisioning output
4. **Validation Logs**: Test results and health check outputs
5. **Rollback Logs**: Version rollback operation logs

### Alert System (Console-Based)

- Simulated alerts printed to terminal
- Deployment failure notifications
- Environment health warnings
- Script-based alert triggers

## Usage Instructions

### Prerequisites

- **No external accounts required** - everything runs locally
- Bash shell environment
- Git (optional, for version control simulation)

### Local Testing (Everything Simulated)

```bash
# Make scripts executable
chmod +x scripts/*.sh

# Simulate infrastructure setup
./scripts/simulate_infrastructure.sh

# Test bot validation
./scripts/validate_bot.sh

# Test deployments to different environments
./scripts/deploy_bot.sh dev
./scripts/deploy_bot.sh test
./scripts/deploy_bot.sh prod

# Test rollback capability
./scripts/rollback_bot.sh dev
```

### Infrastructure Files

The `infrastructure/` folder contains Terraform definitions that **show what would be provisioned** in a real Azure environment. Since no Azure access is available, use:

```bash
# Run the infrastructure simulation instead
./scripts/simulate_infrastructure.sh
```

### Pipeline Definition

The `pipelines/azure-pipelines.yml` file **defines** how the CI/CD pipeline would work in Azure DevOps. To see the pipeline logic in action, run the individual scripts as shown above.

## Important: This is a Fully Simulated Implementation

### Key Points

- **No Azure Access Required**: Everything runs locally on your machine
- **No Azure DevOps**: Pipeline YAML shows design, not actual execution
- **No Automation Anywhere**: All API calls are simulated/mocked
- **No Cloud Resources**: All infrastructure is simulated locally
- **No External Dependencies**: Self-contained demonstration

### What This Demonstrates

This project shows the **design and architecture** of an RPA DevOps pipeline, including:

- **CI/CD Pipeline Design**: How deployments would flow through environments
- **Infrastructure as Code**: What resources would be needed (simulated)
- **Environment Management**: Separation between dev/test/prod
- **Rollback Strategies**: How to recover from deployment failures
- **Monitoring Concepts**: Basic observability patterns
- **Agent-Based Automation**: Decision-making logic for deployments

### Assumptions

- **Single Bot Focus**: Designed for one bot deployment (easily extensible)
- **HTTP-based APIs**: Shows REST API interaction patterns
- **JSON Configuration**: Standard bot package format
- **Local Execution**: All demos run on local machine

### Trade-offs (By Design)

- **Full Simulation**: No real cloud execution to avoid costs/dependencies
- **Console Logging**: Simple monitoring vs enterprise dashboards
- **Local State**: File-based vs remote state management
- **Manual Testing**: Human-driven demos vs automated pipelines

### Design Decisions

- **Zero External Dependencies**: Enables anyone to run the demonstration
- **Script-Based**: Portable automation using standard bash
- **Configuration-Driven**: Environment-specific settings in YAML
- **Version-Aware**: Bot versioning for deployment tracking
- **Fail-Fast**: Early validation and error handling

### Scaling to Production

To use this in a real environment with Azure access:

1. **Connect Terraform** to actual Azure subscription
2. **Import pipeline YAML** into Azure DevOps
3. **Configure service connections** for Azure resources
4. **Set up Key Vault** for real secrets management
5. **Connect to Automation Anywhere** Control Room
6. **Enable real monitoring** and alerting

This simulated version provides a complete blueprint for production RPA DevOps implementation.

## Contributing

1. Fork the repository
2. Create feature branch
3. Make changes with proper testing
4. Submit pull request with documentation

## License

This project is licensed under the MIT License - see the LICENSE file for details.