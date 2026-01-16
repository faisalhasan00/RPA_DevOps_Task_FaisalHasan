#!/bin/bash

# RPA DevOps Demo Script for Video Walkthrough
# This script demonstrates the complete workflow

echo "🎬 RPA DevOps Automation Demo"
echo "=============================="
echo ""

# Function to pause for user input
pause() {
    echo ""
    echo "Press Enter to continue..."
    read
}

echo "Step 1: Project Overview"
echo "------------------------"
echo "This demonstrates a complete RPA DevOps pipeline for Automation Anywhere A360"
ls -la
pause

echo "Step 2: Infrastructure Setup (Simulated)"
echo "----------------------------------------"
echo "Running: ./scripts/simulate_infrastructure.sh"
./scripts/simulate_infrastructure.sh
pause

echo "Step 3: Bot Validation"
echo "----------------------"
echo "Running: ./scripts/validate_bot.sh"
./scripts/validate_bot.sh
pause

echo "Step 4: Deployment to Development"
echo "----------------------------------"
echo "Running: ./scripts/deploy_bot.sh dev"
./scripts/deploy_bot.sh dev
pause

echo "Step 5: Deployment to Test Environment"
echo "---------------------------------------"
echo "Running: ./scripts/deploy_bot.sh test"
./scripts/deploy_bot.sh test
pause

echo "Step 6: Deployment to Production"
echo "---------------------------------"
echo "Running: ./scripts/deploy_bot.sh prod"
./scripts/deploy_bot.sh prod
pause

echo "Step 7: Rollback Demonstration"
echo "-------------------------------"
echo "Running: ./scripts/rollback_bot.sh dev"
./scripts/rollback_bot.sh dev
pause

echo "Step 8: Agent Configurations"
echo "----------------------------"
echo "Showing intelligent agents:"
echo ""
echo "Deployment Decision Agent:"
cat agents/deployment_agent.yaml
echo ""
pause

echo "Infrastructure Health Agent:"
cat agents/infra_health_agent.yaml
echo ""
pause

echo "Step 9: Pipeline Configuration"
echo "------------------------------"
echo "Azure DevOps Pipeline YAML:"
head -20 pipelines/azure-pipelines.yml
echo "... (truncated)"
pause

echo "🎉 Demo Complete!"
echo "================="
echo ""
echo "This demonstration showed:"
echo "✅ Infrastructure provisioning (simulated)"
echo "✅ Bot validation and versioning"
echo "✅ Multi-environment deployments"
echo "✅ Rollback capabilities"
echo "✅ Intelligent agents"
echo "✅ CI/CD pipeline configuration"
echo ""
echo "The solution is enterprise-ready and scales to production environments!"
echo ""
echo "📁 Generated files:"
echo "- infrastructure_state/simulated_infrastructure.json"
echo "- deployment_history.log (if exists)"
echo "- validation_report_*.json"