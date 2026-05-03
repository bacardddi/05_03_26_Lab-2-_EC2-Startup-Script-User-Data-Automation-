#!/bin/bash

# Update the system
dnf update -y

# Install Apache (called httpd on Amazon Linux)
dnf install -y httpd

# Start Apache and enable it on boot
systemctl start httpd
systemctl enable httpd

# Create your HTML webpage
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My EC2 Page</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #1a1a2e; color: #eaeaea; margin: 0; padding: 0; }
        header { background-color: #16213e; padding: 40px; text-align: center; }
        header h1 { color: #e94560; font-size: 3em; }
        section { max-width: 900px; margin: 40px auto; padding: 30px; background-color: #16213e; border-radius: 10px; }
        section h2 { color: #e94560; }
        img { width: 200px; border-radius: 10px; display: block; margin: 20px auto; }
        footer { text-align: center; padding: 20px; background-color: #16213e; color: #888; }
    </style>
</head>
<body>
    <header>
        <h1>Hi, I'm Bakari</h1>
        <p>Cloud Foundations Student | AWS Learner</p>
    </header>

    <section>
        <h2>About Me</h2>
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Amazon_Web_Services_Logo.svg/320px-Amazon_Web_Services_Logo.svg.png" alt="AWS Logo">
        <p>I am currently learning cloud computing through the TheoWAF Cloud Foundations program.
        This page is hosted on an AWS EC2 instance configured entirely through a Bash startup script.</p>
    </section>

    <section>
        <h2>Project Description</h2>
        <p>This project demonstrates Linux automation using Bash scripting. When this EC2 instance launched, a User Data script automatically:</p>
        <ul>
            <li>Updated the system packages</li>
            <li>Installed the Apache web server (httpd)</li>
            <li>Created and deployed this HTML page</li>
            <li>Started Apache so the page is publicly accessible</li>
        </ul>
    </section>

    <section>
        <h2>Contact</h2>
        <p>GitHub: github.com/YOUR_USERNAME</p>
        <p>Program: TheoWAF Cloud Foundations</p>
    </section>

    <footer>
        <p>Hosted on AWS EC2 | Deployed via Bash User Data Script</p>
    </footer>
</body>
</html>
EOF

# Restart Apache
systemctl restart httpd