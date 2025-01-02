# Local AI Stack with Docker Compose and Ansible

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
    - [Docker Compose Setup](#docker-compose-setup)
    - [Ansible Playbook Setup](#ansible-playbook-setup)
- [Services](#services)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository contains a complete local AI stack setup using Docker Compose and Ansible. The stack includes several AI-related services, such as Ollama, Open-WebUI, SearxNG, Stable Diffusion, Whisper, and more. The configuration ensures the integration of [Traefik](https://traefik.io/traefik/) for reverse proxy and Let's Encrypt for SSL/TLS certificates.

For limited experience on macOS use compose-mac.yaml (Ollama should run separately, no stable diffusion support at the moment)

### Thanks
Huge thanks go to [Techno Tim](https://www.youtube.com/@TechnoTim) and his video [Self-Hosted AI That's Actually Useful](https://www.youtube.com/watch?v=GrLpdfhTwLg&t=616s), and [tutorial](https://technotim.live/posts/ai-stack-tutoria) which inspired me to finally gather all these services into one Docker Compose stack.

## Prerequisites
- Docker
- Docker Compose
- Ansible
- NVIDIA GPU and drivers

## Installation

### Ansible Playbook Setup

This playbook is used to install docker and nvidia software and drivers.

1. **Install Ansible:**
    ```
    sudo apt update
    sudo apt install ansible -y
    ```

2. **Clone the repository:**
    ```
    git clone https://github.com/DmitryBoiadji/ai-stack.git
    cd ai-stack
    ```

3. **Edit the `group_vars/all.yml` file** with your configuration.

4. **Configure your hosts file**

5. **Run the Ansible playbook:**
    ```
    ansible-playbook -i hosts playbook.yml
    ```


### Docker Compose Setup

1 **Create an `.env` file:**
    ```
    cp .env.example .env
    ```

2 **Modify the `.env` file** with your configuration

3 **Start the Docker Compose stack:**
    ```
    docker-compose up -d  
    ```  

For more information please take a look at Techno Tim's [tutorial](https://technotim.live/posts/ai-stack-tutoria)


## Services
The stack includes the following services:

- **Ollama**: A platform for running and deploying language models locally
- **Open-WebUI**: A web interface for AI models.
- **SearxNG**: A privacy-respecting metasearch engine.
- **Stable Diffusion**: A deep learning, text-to-image model.
- **Whisper**: An AI-powered transcription and translation service.
- **MongoDB**: A NoSQL database for storing Whisper data.
- **LibreTranslate**: An open-source machine translation API.

## Usage 
- Access **Open-WebUI** at `https://chat.your_app_domain`
- Access **SearxNG** at `http://searxng:8080/search?q=<query>` _(local docker network only)_
- Access **Stable Diffusion** at `https://sd.your_app_domain`
- Access **Whisper** at `https://whisper.your_app_domain`

## Tools

update_models.sh - Run on ollama docker to recursively update all models.

## Contributing
Contributions are welcome! Please fork the repository and create a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
