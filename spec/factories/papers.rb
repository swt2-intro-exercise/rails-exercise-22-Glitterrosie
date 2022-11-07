FactoryBot.define do
  factory :paper do
    title {"COMPUTING MACHINERY AND INTELLIGENCE"}
    venue {"Mind 49: 433-460"}
    year {1950}
    authors {build_list :author, 1}
  end

  factory :paper1 , class: Paper do
    title {"COMPUTING MACHINERY AND INTELLIGENCE"}
    venue {"Mind 49: 433-460"}
    year {1950}
  end
end