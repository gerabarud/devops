Designing and implementing strategies for collaboration, code, infrastructure, source control, security, compliance, continuous integration, testing, delivery, monitoring, and feedback.


- Microsoft Azure Virtual Training Day: DevOps with GitHub <br>
https://mktoevents.com/Microsoft+Event/401273/157-GQE-382?wt.mc_id=eventscatalog

- Exam AZ-400: Designing and Implementing Microsoft DevOps Solutions <br> 
https://learn.microsoft.com/en-us/certifications/exams/az-400/

## Introduction to DevOps

### Objectives & Prerequisites

Learning objectives:
- Plan for the transformation with shared goals and timelines.
- Select a project and identify project metrics and Key Performance Indicators (KPIs).
- Create a team and agile organizational structure.
- Design a tool integration strategy.
- Design a license management strategy (for example, Azure DevOps and GitHub users).
- Design a plan for end-to-end traceability from work items to working software.
- Design an authentication and access strategy.
- Design a strategy for integrating on-premises and cloud resources.

Prerequisites
- Azure Fundamentals: https://learn.microsoft.com/en-us/learn/paths/az-900-describe-cloud-concepts/
- Azure Administration: https://learn.microsoft.com/en-us/learn/paths/az-104-administrator-prerequisites/
- Azure Developer: https://learn.microsoft.com/en-us/learn/paths/create-serverless-applications/
- Create an Azure DevOps Organization: https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization
- Create Team Project: use the Azure DevOps Demo Generator [https://azuredevopsdemogenerator.azurewebsites.net] and create a new Team Project called "Parts Unlimited" using the template "PartsUnlimited." Or feel free to create a blank project. See https://learn.microsoft.com/en-us/azure/devops/organizations/projects/create-project
- Create a new repository: https://docs.github.com/repositories/creating-and-managing-repositories/creating-a-new-repository

### What is DevOps?
The contraction of "Dev" and "Ops" refers to replacing siloed Development and Operations. The idea is to create multidisciplinary teams that now work together with shared and efficient practices and tools. Essential DevOps practices include agile planning, continuous integration, continuous delivery, and monitoring of applications.

### Explore the DevOps journey

- **Continuous Integration** drives the ongoing **merging** and **testing** of code, leading to an early finding of defects. Other benefits include less time wasted fighting merge issues and rapid feedback for development teams.
- **Continuous Delivery** of software solutions to production and testing environments helps organizations **quickly fix bugs** and **respond to ever-changing business requirements**.
- **Version Control**, usually with a Git-based Repository, enables teams worldwide to communicate effectively during daily development activities. Also, integrate with software development tools for monitoring activities such as deployments.
- Use **Agile planning** and lean project management techniques to:
    - Plan and isolate work into sprints.
    - Manage team capacity and help teams quickly adapt to changing business needs.
    - A DevOps Definition of Done is working software collecting telemetry against the intended business goals.
- **Monitoring and Logging** of running applications. Including production environments for application health and customer usage. It helps organizations create a hypothesis and quickly validate or disprove strategies. Rich data is captured and stored in various logging formats.
- **Public and Hybrid Clouds** have made the impossible easy. The cloud has removed traditional bottlenecks and helped commoditize Infrastructure. You can use Infrastructure as a Service (IaaS) to lift and shift your existing apps or Platform as a Service (PaaS) to gain unprecedented productivity. The cloud gives you a data center without limits.
- **Infrastructure as Code (IaC):** Enables the automation and validation of the creation and teardown of environments to help deliver secure and stable application hosting platforms.
- Use **Microservices architecture** to isolate business use cases into small reusable services that communicate via interface contracts. This architecture enables scalability and efficiency.
- **Containers** are the next evolution in virtualization. They're much more lightweight than virtual machines, allow much faster hydration, and easily configure files.