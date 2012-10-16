class AddAccessRequirementsToDiplomas < ActiveRecord::Migration
  def self.up
    add_column :diplomas, :access_requirements, :string

    Diploma.find_each do |diploma|
      diploma.access_requirements = 'certificate_of_complete_secondary_education'
      diploma.save(false)
    end
  end

  def self.down
    remove_column :diplomas, :access_requirements
  end
end
