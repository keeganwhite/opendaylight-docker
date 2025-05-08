# Opendaylight Docker

Scandium SR2/v0.21.2 Opendaylight Docker Containers.

# Run the Images

## Base

`docker-compose up -d`

## Openflow Enabled Controller

`docker-compose -f docker-compose.openflow.yml up -d`

# Build and Test Images

## Base Image

- Build: `docker build -t opendaylight-base:local -f Dockerfile .`
- Test: `docker run --name odl-test-base-debug -p 8181:8181 -p 8101:8101 opendaylight-base:local`

## Openflow Image

- Build `docker build -t opendaylight-openflow:local -f Dockerfile.openflow .`
- Test: `docker run --name odl-test-openflow-debug -p 8181:8181 -p 8101:8101 opendaylight-openflow:local`

## Connecting to the ODL Container

Connect to the Docker container `docker exec -it odl-openflow bin/client` where `odl-openflow` is the name of your container set in your docker compose file.
