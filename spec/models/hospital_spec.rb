require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe 'instance methods' do
    before :each do
      @hospital = Hospital.create(name: "Paiser Al Dente")
      doc_1 = @hospital.doctors.create(name: "Dr. Bob", specialty: "Pediatrics", university: "UCLA")
      doc_2 = @hospital.doctors.create(name: "Dr. Jim", specialty: "Orthopedics", university: "UCSD")
      doc_3 = @hospital.doctors.create(name: "Dr. Joe", specialty: "Neurology", university: "UCLA")
      doc_3 = @hospital.doctors.create(name: "Dr. Tim", specialty: "Cardiology", university: "UCSF")
    end

    it '#num_of_docs' do
      expect(@hospital.num_of_docs).to eq(4)
    end

    it '#doc_unis' do
      expect(@hospital.doc_unis).to eq("UCLA, UCSD, and UCSF")
    end
  end
end
