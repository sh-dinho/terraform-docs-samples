# [START compute_spot_instance_create]

resource "google_compute_instance" "spot_vm_instance" {
  name         = "spot-instance-name"
  machine_type = "f1-micro"
  zone         = "us-central1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  scheduling {
      preemptible = true
      automatic_restart = false
      provisioning_model = "SPOT"
      instance_termination_action = "STOP"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

# [END compute_spot_instance_create]
