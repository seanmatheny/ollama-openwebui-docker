version: '3.8'
services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama
    ports:
    - 11434:11434
    volumes:
    - ollama_data:/root/.ollama
    restart: unless-stopped
    deploy:
      resources:
        reservations:
          devices:
          - capabilities:
            - gpu
  open-webui:
    image: ghcr.io/open-webui/open-webui:main
    container_name: open-webui
    ports:
    - 3000:8080
    environment:
      OLLAMA_API_BASE_URL: http://ollama:11434
    depends_on:
    - ollama
    volumes:
    - openwebui_data:/app/backend/data
    restart: unless-stopped
  model-init:
    image: curlimages/curl:latest
    container_name: model-init
    depends_on:
    - ollama
    volumes:
    - ./pull_gpt_oss_20b.sh:/pull_gpt_oss_20b.sh
    entrypoint:
    - sh
    - /pull_gpt_oss_20b.sh
    restart: on-failure
volumes:
  ollama_data: {}
  openwebui_data: {}
