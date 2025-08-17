### Simple Docker compose launcher for a self-hosted ollama, open-webui, traefik proxy, and LetsEncrypt built in. ###

*Instructions for a blank Ubuntu Jammy or Noble instance with a GPU attached:*
1. Install your preferred version of the NVIDIA driver and CUDA.
2. Run `install_docker.sh` to install all Docker and NVIDIA prerequisites
3. Edit `.env` to set the FQDN of the VM's hostname and your email address (for LetsEncrypt)
4. Bring up the environment with `docker compose up -d`
5. Once launched, you should be able to access `https://<FQDN>`. To pull a model, once an account is created, click:
-> Name / Avatar in lower right
-> Admin Panel
-> Settings
-> Models
-> Manage Models (down arrow)
-> Type the tag or the model (list of tags/models viewable from the link provided)

If you prefer a more basic setup, or don't have public access to 443 for LetsEncrypt, you can instead run `docker_compose_basic.yml` 
