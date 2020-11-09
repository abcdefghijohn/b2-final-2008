class Hospital < ApplicationRecord
  has_many :doctors

  def num_of_docs
    self.doctors.count
  end

  def doc_unis
    uni_array.to_sentence
  end

  def uni_array
    self.doctors.select(:university).distinct.pluck(:university)
  end
end
