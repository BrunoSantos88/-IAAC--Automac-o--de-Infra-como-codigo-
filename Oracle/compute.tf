resource "oci_core_instance" "test_instance" {
	count = 2
	availability_domain = "zCce:SA-SAOPAULO-1-AD-1"
	compartment_id = var.compartment
	shape = "VM.Standard.E2.1.Micro"
	display_name = "Server ${count.index + 1}"
	
	source_details {
		source_id = "ocid1.image.oc1.sa-saopaulo-1.#################"
		source_type = "image"
	}

	 create_vnic_details {
		subnet_id = oci_core_subnet.test_subnet.id
	}

	metadata = {
        ssh_authorized_keys = file("/root/.ssh/id_rsa.pub")
     }
    preserve_boot_volume = false
}
