require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a doctors show page" do
    it "I see the doctors name, specialty, university, hospital, and all their patients" do
      hospital = Hospital.create(name: "Paiser Al Dente")
      doc = hospital.doctors.create(name: "Dr. Bob", specialty: "Pediatrics", university: "UCLA")
      sam = doc.patients.create(name: "Sam Bob", age: 4)
      pam = doc.patients.create(name: "Pam Bob", age: 5)
      cam = doc.patients.create(name: "Cam Bob", age: 3)
      visit "/doctors/#{doc.id}"

      expect(page).to have_content(doc.name)
      expect(page).to have_content(doc.specialty)
      expect(page).to have_content(doc.university)
      expect(page).to have_content(doc.hospital.name)
      expect(page).to have_content(sam.name)
      expect(page).to have_content(pam.name)
      expect(page).to have_content(cam.name)
    end
  end

  describe "When I visit a doctor's show page, I see a remove button next to each patient" do
    it "I click the 'Remove Patient' button and I am brought back to the show page and no longer
       see the patient" do
      hospital = Hospital.create(name: "Paiser Al Dente")
      doc = hospital.doctors.create(name: "Dr. Bob", specialty: "Pediatrics", university: "UCLA")
      sam = doc.patients.create(name: "Sam Bob", age: 4)
      pam = doc.patients.create(name: "Pam Bob", age: 5)
      cam = doc.patients.create(name: "Cam Bob", age: 3)

      visit "/doctors/#{doc.id}"

      within "#patient-#{sam.id}" do
        expect(page).to have_button('Remove Patient')
        click_on('Remove Patient')
        expect(page).to_not have_content(sam.name)
      end
    end
  end
end
