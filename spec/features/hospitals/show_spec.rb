require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a hospital's show page" do
    it "I see the hospital name, number of doctors, and a list of universities of doctors" do
      hospital = Hospital.create(name: "Paiser Al Dente")
      doc_1 = hospital.doctors.create(name: "Dr. Bob", specialty: "Pediatrics", university: "UCLA")
      doc_2 = hospital.doctors.create(name: "Dr. Jim", specialty: "Orthopedics", university: "UCSD")
      doc_3 = hospital.doctors.create(name: "Dr. Joe", specialty: "Neurology", university: "UCLA")
      doc_3 = hospital.doctors.create(name: "Dr. Tim", specialty: "Cardiology", university: "UCSF")

      visit "/hospitals/#{hospital.id}"

      expect(page).to have_content(hospital.name)
      expect(page).to have_content(hospital.num_of_docs)
      expect(page).to have_content(hospital.doc_unis)
    end
  end
end
