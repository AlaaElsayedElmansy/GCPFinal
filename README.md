# GCP 

## Tools I used

  -  Docker
  -  Terraform
  -  Kubernates
  -  GCP

### Demo

**you can clone the project

    $ git clone https://github.com/AlaaElsayedElmansy/GCPFinal.git

**after that you have to build docker image

    $ docker build -t gcr.io/alaa-368700/app .
    $ docker push gcr.io/alaa-368700/app

**to build infrastructure go to your terraform dire and run

    $ terraform init
    $ terraform applay -auto-approve

**connect to private-vm on gcp then copy /k8s into it after that run

    $ kubectl apply -f redis.yaml 
    $ kubectl apply -f conf.yaml
    $ kubectl apply -f python.yaml 

