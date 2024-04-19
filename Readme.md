## Example CRUD App (Rest Api Microservice)
- Framework: FastApi
- Databackends: Filesystem, CouchDB

<br>

### knatine service example
```
### Create Docker image via Paketo.io / Buildpacks.io ###
pack build ghcr.io/<YOUR GITHUB USER>/crud-example-python:latest \
  --path src
  --buildpack paketo-buildpacks/python \
  --builder paketobuildpacks/builder-jammy-base


### OR via Dockerfiles ###

## official python base image ##
docker build \
  -t ghcr.io/<YOUR GITHUB USER>/crud-example-python:latest .  

## nuitka executable ##
docker build -f Dockerfile-compile \
  -t ghcr.io/<YOUR GITHUB USER>/crud-example-python:latest .   


### Push docker image to GitHub Registry ###
docker push ghcr.io/<YOUR GITHUB USER>/crud-example-python:latest


### Deploy on K8s via knative ###
kubectl create secret docker-registry my-ghcr \
  --docker-server=https://ghcr.io/ \
  --docker-email=<YOUR GITHUB EMAIL> \
  --docker-username=<YOUR GITHUB USER> \
  --docker-password=GehHe1m!

kubectl patch serviceaccount default -p "{\"imagePullSecrets\": [{\"name\": \"my-ghcr\"}]}"
kubectl apply -f kn-services.yaml

```