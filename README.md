# Opendaylight Docker
A dockerised version of opendaylight.

Choose the branch you want for your version of Opendaylight (ODL) and then follow the instructions in the README.

# Run these Images

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


