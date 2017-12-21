namespace :dev do
  desc "Configuracion para ambiente de desarrollo"
  task setup: :environment do
    puts"Reseteando base de datos..."
#######################################
    puts "Creando tipos de contacto..."
        kinds = %w(Amigo Comercial Conocido)  
        kinds.each do |kind|
          Kind.create!(
            description: kind
          )
        end
    puts "Tipos Contacto creados!.."
#######################################
    puts "Creando contactos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Contactos creados exitoso..."
########################################

      puts "Cargando telefonos..."

      Contact.all.each do |contact|
        Random.rand(5).times do |i|
          phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
          contact.phones << phone
          contact.save!
        end
      end

      puts "Telefonos creados con exitoso..."
############################################

      puts "Creando direcciones..."

      Contact.all.each do |contact|
        Address.create(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          contact: contact
        )
      end

      puts "Direcciones creadas con éxito...!"

  end
end
