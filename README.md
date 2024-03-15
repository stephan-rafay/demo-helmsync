# `demo-helmsync` Repository

This repository serves as a demonstration for deploying applications to Rafay projects using `rafay_workload_cd_operator`. Follow the pre-configuration steps below to set up the required environment:

## Pre-Configuration Steps

1. **Create Projects:**
   - In the Rafay console, create three projects: `project1`, `project2`, and `project3`.

2. **Create/Import Clusters:**
   - For each project, create or import clusters as needed.
   - Label the clusters according to the examples provided in the repository.

   Example Labels:
   - To deploy application `httpecho`, label clusters with `"httpecho" = "enabled"`.

   These labels are utilized in the [`terraform/resource.tf`](#terraform-configuration) for deploying workloads.

3. **Create the following namespaces in the clusters:**
   - For the `httpecho` application, create the namespace `ns-httpecho`.

## Repository Structure

The repository structure `/:project/:workload/:namespace` is organized to demonstrate deploying applications to the specified projects. Refer to the examples and configurations within the repository for a better understanding.

Feel free to explore the content and configurations to adapt them to your specific use case.

For any further assistance, refer to the Rafay documentation or reach out to the Rafay support team.

Happy Deploying!

## Quick Start - Deploying Applications from a Repository

The example demonstrates deploying an application to three projects using the same repository:

**httpecho:** Deployed using a chart from the common folder.
 
Utilize cluster labels to deploy the workload to specific clusters labeled with `"httpecho" = "enabled"`.


The folder structure for the projects is available on GitHub. You can find it [here](https://github.com/stephan-rafay/demo-helmsync.git).

## Terraform Configuration
```hcl
resource "rafay_workload_cd_operator" "operatordemo" {
	metadata {
	  name    = "operatordemo"
	  project = "demoorg"
	}
	spec {
	  repo_local_path = "/tmp/application-repo"
	  repo_url        = "https://github.com/stephan-rafay/demo-helmsync.git"
	  repo_branch     = "main"
	  credentials {
	   username = var.git_user
	   token = var.git_token
	  }
  
	  workload {
		name = "httpecho"
		helm_chart_version = "0.3.4"
		helm_chart_name = "http-echo"
		path_match_pattern = "/:project/:workload/:namespace"
		base_path = "httpecho-common"
		include_base_value = true
		delete_action = "delete"
		placement_labels = {
		  "httpecho" = "enabled"
		}
	  }   
	}
	always_run = "${timestamp()}"
  }
```

## Run

`cd terraform`

`terraform init`

`terraform apply`

