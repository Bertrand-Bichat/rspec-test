FactoryBot.define do
  factory :comment do
    content { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }

    factory :comment_empty do
      content { "" }
    end

  end
end
