# Cloud Native Portfolio Makefile

# Variables
APP_NAME := portfolio
VERSION := $(shell git describe --tags --always --dirty)
REGISTRY := ghcr.io
IMAGE := $(REGISTRY)/$(GITHUB_REPOSITORY)
NAMESPACE := portfolio
CLUSTER_NAME := portfolio-cluster

# Help target
.PHONY: help
help: ## Show this help message
	@echo "Cloud Native Portfolio - Available Commands:"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# Development
.PHONY: install
install: ## Install dependencies
	npm install

.PHONY: dev
dev: ## Start development server
	npm start

.PHONY: build
build: ## Build the application
	npm run build

.PHONY: test
test: ## Run tests
	npm test

.PHONY: lint
lint: ## Run linting
	npm run lint

.PHONY: lint-fix
lint-fix: ## Fix linting issues
	npm run lint:fix

# Docker commands
.PHONY: docker-build
docker-build: ## Build Docker image
	docker build -t $(APP_NAME):$(VERSION) -t $(APP_NAME):latest .

.PHONY: docker-run
docker-run: ## Run Docker container
	docker run -p 80:80 --name $(APP_NAME) $(APP_NAME):latest

.PHONY: docker-stop
docker-stop: ## Stop Docker container
	docker stop $(APP_NAME) || true
	docker rm $(APP_NAME) || true

.PHONY: docker-push
docker-push: ## Push Docker image to registry
	docker tag $(APP_NAME):$(VERSION) $(IMAGE):$(VERSION)
	docker tag $(APP_NAME):latest $(IMAGE):latest
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

# Docker Compose
.PHONY: compose-dev
compose-dev: ## Start development environment with Docker Compose
	docker-compose --profile dev up

.PHONY: compose-prod
compose-prod: ## Start production environment with Docker Compose
	docker-compose up -d

.PHONY: compose-monitoring
compose-monitoring: ## Start monitoring stack
	docker-compose --profile monitoring up -d

.PHONY: compose-down
compose-down: ## Stop all Docker Compose services
	docker-compose down

.PHONY: compose-logs
compose-logs: ## Show Docker Compose logs
	docker-compose logs -f

# Kubernetes
.PHONY: k8s-create-namespace
k8s-create-namespace: ## Create Kubernetes namespace
	kubectl create namespace $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -

.PHONY: k8s-deploy
k8s-deploy: k8s-create-namespace ## Deploy to Kubernetes
	kubectl apply -f k8s/ -n $(NAMESPACE)

.PHONY: k8s-delete
k8s-delete: ## Delete Kubernetes resources
	kubectl delete -f k8s/ -n $(NAMESPACE) || true

.PHONY: k8s-status
k8s-status: ## Check Kubernetes deployment status
	kubectl get all -n $(NAMESPACE)

.PHONY: k8s-logs
k8s-logs: ## Show Kubernetes logs
	kubectl logs -f deployment/portfolio-frontend -n $(NAMESPACE)

.PHONY: k8s-port-forward
k8s-port-forward: ## Port forward to local machine
	kubectl port-forward service/portfolio-frontend-service 8080:80 -n $(NAMESPACE)

# Helm
.PHONY: helm-install
helm-install: ## Install with Helm
	helm install $(APP_NAME) helm/portfolio/ --namespace $(NAMESPACE) --create-namespace

.PHONY: helm-upgrade
helm-upgrade: ## Upgrade with Helm
	helm upgrade $(APP_NAME) helm/portfolio/ --namespace $(NAMESPACE)

.PHONY: helm-uninstall
helm-uninstall: ## Uninstall with Helm
	helm uninstall $(APP_NAME) --namespace $(NAMESPACE)

.PHONY: helm-template
helm-template: ## Generate Helm templates
	helm template $(APP_NAME) helm/portfolio/ --namespace $(NAMESPACE)

# Terraform
.PHONY: tf-init
tf-init: ## Initialize Terraform
	cd terraform && terraform init

.PHONY: tf-plan
tf-plan: ## Run Terraform plan
	cd terraform && terraform plan

.PHONY: tf-apply
tf-apply: ## Apply Terraform configuration
	cd terraform && terraform apply

.PHONY: tf-destroy
tf-destroy: ## Destroy Terraform infrastructure
	cd terraform && terraform destroy

.PHONY: tf-output
tf-output: ## Show Terraform outputs
	cd terraform && terraform output

# Security
.PHONY: security-scan
security-scan: ## Run security scan
	docker run --rm -v $(PWD):/workspace aquasec/trivy fs /workspace

.PHONY: security-scan-image
security-scan-image: ## Scan Docker image
	docker run --rm aquasec/trivy image $(APP_NAME):latest

# Monitoring
.PHONY: monitoring-up
monitoring-up: ## Start monitoring stack
	docker-compose --profile monitoring up -d

.PHONY: monitoring-down
monitoring-down: ## Stop monitoring stack
	docker-compose --profile monitoring down

.PHONY: grafana-dashboard
grafana-dashboard: ## Open Grafana dashboard
	open http://localhost:3001

.PHONY: prometheus-ui
prometheus-ui: ## Open Prometheus UI
	open http://localhost:9090

# Cleanup
.PHONY: clean
clean: ## Clean build artifacts
	npm run clean
	docker system prune -f
	docker volume prune -f

.PHONY: clean-all
clean-all: clean docker-stop compose-down ## Clean everything
	docker rmi $(APP_NAME):latest $(APP_NAME):$(VERSION) 2>/dev/null || true

# CI/CD
.PHONY: ci
ci: lint test build docker-build ## Run CI pipeline locally

.PHONY: release
release: ci docker-push ## Build and push release

# Quick start
.PHONY: quick-start
quick-start: install build docker-build docker-run ## Quick start for new developers
	@echo "🚀 Application is running at http://localhost"
	@echo "📊 To start monitoring: make monitoring-up"
	@echo "🔍 To view logs: make docker-logs"

# Production deployment
.PHONY: deploy-prod
deploy-prod: ## Deploy to production
	@echo "🚀 Deploying to production..."
	$(MAKE) docker-build
	$(MAKE) docker-push
	$(MAKE) helm-upgrade
	@echo "✅ Production deployment complete!"

.DEFAULT_GOAL := help
