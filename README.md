# httpenv2

Tiny Node.js/Express server that returns environment variables as JSON.

## Purpose

This project is used to test GitHub flow, GitHub Actions, and Docker builds.

## Runtime behavior

- Endpoint: `GET /`
- Response: current process environment (`process.env`) as JSON
- Default port: `3000`

## Local development

### Prerequisites

- Docker Desktop (or Docker Engine + Compose plugin)
- Access to Docker Hardened Images registry (`dhi.io`)

### Login to Docker Hardened Images

This project builds from `dhi.io/node:25-dev` and `dhi.io/node:25`, so authenticate before building:

```bash
docker login dhi.io
```

### Build and run with Compose

```bash
docker compose up --build
```

Then open [http://localhost:3000](http://localhost:3000).

## Container image notes

- `Dockerfile` uses a multi-stage build:
  - Build stage: `dhi.io/node:25-dev`
  - Runtime stage: `dhi.io/node:25`
- Runtime image is hardened and minimal.

## CI notes

The GitHub Actions workflow logs in to both:

- `ghcr.io` (for publishing)
- `dhi.io` (to pull hardened Node base images)