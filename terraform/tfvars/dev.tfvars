project_id   = "suml-dev-s28722-499308"
project_name = "suml-dev-s28722"
env          = "dev"
region       = "europe-west3"

cloud_run_service_name  = "burnout-app"
container_port          = 8080
allow_unauthenticated   = true
cloud_run_min_instances = 1
cloud_run_max_instances = 3
cloud_run_memory        = "512Mi"
