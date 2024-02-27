# PHP-Docker-Alpine-Nginx-MySQL

**Description**:  
This repository serves as a comprehensive template for kickstarting PHP web development projects using Docker, Alpine Linux, Nginx, and MySQL. It includes a sample application built on the Fat-Free Framework (F3) and HTMX for dynamic, seamless user experiences. With Docker-based environment setup, developers can quickly spin up a local development environment that mirrors production, ensuring consistency and ease of deployment. This boilerplate provides a solid foundation for building robust and scalable PHP applications with minimal setup overhead.

**Key Features**:

- Docker-based environment for easy setup and deployment
- Alpine Linux for lightweight and efficient containerization
- Nginx as the web server for fast and reliable serving of PHP applications
- MySQL database included for local development and testing
- Fat-Free Framework (F3) utilized for rapid development of PHP applications
- HTMX integrated for AJAX-driven, client-side interactions without sacrificing server-side simplicity
- Traefik proxy for local development.
- Local PHPMyAdmin database administration interface.
- Chadburn job scheduling.
- Added Foundation for Sites

**Usage**:

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `docker-compose up` to start the development environment.
4. Access the sample application at `http://localhost`.
5. Access the database via PHPMyAdmin at `https://phpmyadmin.localhost`.

**Notes**:

- Ensure Docker and Docker Compose are installed on your system.
- Modify the sample application or replace it with your own code to suit your project requirements.
- Refer to the provided documentation for detailed configuration options and customization guidelines.
- Make use of Composer to manage your PHP dependencies. Default composer.json preconfigured to set vendor/ directory inside public_html/

**Deployment**

- Deployments guides coming soon.
