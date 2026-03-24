# {{COMPANY_NAME}} Technology Stack

Approved technologies for {{COMPANY_NAME}} applications.

---

## 1. Languages

| Language | Version | Use Case |
|----------|---------|----------|
| Java | 17+ | Backend services |
| TypeScript | 5.x | Frontend applications |
| Python | 3.11+ | Scripting, automation |
| Go | 1.21+ | CLI tools, utilities |

### Guidelines
- Prefer TypeScript over JavaScript
- Use latest LTS versions
- Check with Architecture team before introducing new languages

---

## 2. Backend Frameworks

| Framework | Version | Use Case |
|-----------|---------|----------|
| Spring Boot | 3.3.x | REST APIs, microservices |
| Quarkus | 3.x | Cloud-native services |
| Micronaut | 4.x | Serverless functions |

### Database Access
| Technology | Use Case |
|------------|----------|
| MyBatis | Complex queries, legacy |
| Spring Data JPA | Simple CRUD |
| jOOQ | Type-safe SQL |

---

## 3. Frontend Frameworks

| Framework | Version | Use Case |
|-----------|---------|----------|
| React | 19.x | All new UI development |
| ExtJS | 7.x | Legacy (migration only) |

### Build Tools
| Tool | Version | Use Case |
|------|---------|----------|
| Rspack | Latest | Production builds |
| Vite | 5.x | Development, small projects |
| Webpack | 5.x | Legacy projects |

### State Management
| Tool | Use Case |
|------|----------|
| React Query | Server state |
| Zustand | Client state |
| Context API | Simple shared state |

### Styling
| Tool | Use Case |
|------|----------|
| SCSS | Component styles |
| CSS Modules | Scoped styles |
| Tailwind | Utility classes (with approval) |

---

## 4. Databases

| Database | Use Case |
|----------|----------|
| PostgreSQL 15+ | Production RDBMS |
| H2 | Local development, testing |
| Elasticsearch 8.x | Search, analytics |
| Redis 7.x | Caching, sessions |

### Guidelines
- PostgreSQL is default for new projects
- H2 for local development only
- No production use of embedded databases

---

## 5. Infrastructure

### Container Runtime
| Tool | Use Case |
|------|----------|
| Docker | Local development |
| Kubernetes | Production orchestration |
| ECS/Fargate | AWS deployments |

### Cloud Services (AWS)
| Service | Use Case |
|---------|----------|
| S3 | Object storage |
| RDS | Managed databases |
| Lambda | Serverless functions |
| SQS/SNS | Messaging |
| CloudWatch | Monitoring, logging |

### CI/CD
| Tool | Use Case |
|------|----------|
| Jenkins | Build pipelines |
| GitHub Actions | OSS projects |
| ArgoCD | Kubernetes deployments |

---

## 6. Testing

| Tool | Use Case |
|------|----------|
| JUnit 5 | Java unit tests |
| Mockito | Java mocking |
| Jest | JavaScript/TypeScript tests |
| React Testing Library | Component tests |
| Playwright | E2E tests |
| Testcontainers | Integration tests |

---

## 7. Monitoring & Observability

| Tool | Use Case |
|------|----------|
| Datadog | APM, metrics |
| Splunk | Log aggregation |
| PagerDuty | Alerting, on-call |
| Sentry | Error tracking |

---

## 8. Security Tools

| Tool | Use Case |
|------|----------|
| {{COMPANY_NAME}} Lifecycle | SCA, dependency scanning |
| Fortify | SAST |
| OWASP ZAP | DAST |
| HashiCorp Vault | Secrets management |

---

## 9. Documentation

| Tool | Use Case |
|------|----------|
| Markdown | Technical docs |
| OpenAPI/Swagger | API documentation |
| Storybook | Component documentation |
| Confluence | Team documentation |

---

## 10. Package Management

| Tool | Ecosystem |
|------|-----------|
| Maven | Java |
| Yarn 4.x | JavaScript/TypeScript |
| pip | Python |
| go mod | Go |

### Guidelines
- Always use lockfiles
- Pin major versions
- Check Lifecycle before adding dependencies
- Use {{COMPANY_NAME}} Nexus Repository for internal packages

---

## 11. AI Model Providers (Agent-Based Development)

### Approved Providers

Only models from US-based providers are permitted for agent-based development:

| Provider | Platform Access | Approved Models |
|----------|----------------|-----------------|
| **Anthropic** | Claude Code CLI, Cursor, AWS Bedrock | Opus, Sonnet, Haiku |
| **Google** | Cursor, Google Vertex AI | Gemini Pro, Gemini Flash |
| **OpenAI** | Cursor, AWS Bedrock | GPT-5.x, Codex |
| **xAI** | Cursor | Grok Code |

### Prohibited Providers

| Provider | Country | Status |
|----------|---------|--------|
| DeepSeek | China | Prohibited |
| Alibaba (Qwen) | China | Prohibited |
| Any non-US/non-allied provider | Various | Requires security team approval |

### Approved Platforms

| Platform | Use Case |
|----------|----------|
| Claude Code CLI | Primary agent development tool |
| Cursor IDE | IDE-integrated agent development |
| AWS Bedrock | Enterprise API access to Anthropic/OpenAI models |
| Google Vertex AI | Enterprise API access to Gemini models |

### Guidelines

- No local/self-hosted models without explicit security team approval
- No routing through third-party proxy services (OpenRouter, etc.) without security review
- All agent sessions process code that may include proprietary/trade secret material
- Model cost optimization is managed per org Agent0 / Superpowers orchestration policies (document in your fork or internal wiki).

---

## Requesting New Technology

To add technology not on this list:

1. Create ADR (Architecture Decision Record)
2. Present to Architecture Review Board
3. Document:
   - Business justification
   - Security review results
   - Maintenance commitment
   - Migration/exit strategy
4. Obtain written approval
