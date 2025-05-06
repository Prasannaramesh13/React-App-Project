React Application Deployment to a production ready state.
Overview: Monitoring & CI/CD Pipeline with Alerting System,
This project demonstrates a complete DevOps pipeline and server monitoring solution integrating multiple tools and platforms to ensure application health and availability.
Key Components:
    	GitHub: Used as the source code repository for version control and collaboration.
		Jenkins: Implemented as a CI/CD tool to automate the build, test, and deployment of the React application.
		DockerHub: Used to store and distribute Docker images built from Jenkins.
		AWS EC2: Served as the cloud infrastructure to host the application and monitoring services.
		Docker: Used for containerizing all services including the application and monitoring tools.
		Prometheus: Deployed in a Docker container to scrape metrics and monitor the health of services and servers.
     	Blackbox Exporter: Integrated with Prometheus to perform endpoint probing and detect availability issues.
		Alertmanager: Configured to send alerts based on Prometheus rules.
Workflow Overview:
1.	CI/CD Pipeline:
	
                    Code is pushed to GitHub.
	•	Jenkins detects changes, builds the React app, and pushes the Docker image to DockerHub.
	•	The image is then deployed to AWS  EC2 inside Docker containers.
2.	Monitoring & Alerts:
	
          	Prometheus scrapes targets and metrics, including Blackbox probes.
	•	Alertmanager processes alert rules and triggers notifications.
	•	When a service or endpoint becomes unreachable, an email alert is sent automatically.

Objective:
Ensure high availability and continuous monitoring of services, with automated alerting to preemptively catch failures and reduce downtime.
