class Contact < ApplicationRecord

    belongs_to :kind
    has_many :phones
    has_one :address

    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :address, update_only: true

   # def author
   #     "Franko Campos"
   # end
   # def kind_description
   #     self.kind
   # end
   # def as_json(options={})
   #     super(
   #         root: true, 
   #         methods: [:kind_description, :author, :phones, :address]) 
   # end
end
