/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"

  names       = ["${var.project_id}-remotestate-bucket"]
  project_id = var.project_id
  location   = "us"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 365
      with_state     = "ANY"
      matches_prefix = var.project_id
    }
  }]

  custom_placement_config = {
    data_locations : ["US-EAST4", "US-WEST1"]
    data_locations : ["US-EAST4", "US-WEST1"]
  }
}