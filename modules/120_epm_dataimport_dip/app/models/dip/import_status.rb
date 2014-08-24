class Dip::ImportStatus
  STATUS={:importing_to_tmp => 1,
          :validating => 2,
          :transferring => 3,
          :interrupted => 4,
          :finished => 5,
          :import_to_tmp_error => 6,
          :validate_error => 7,
          :transfer_error => 8,
          :program_exception =>9
  }
end