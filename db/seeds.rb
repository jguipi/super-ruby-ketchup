# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Organisme.create([{name: 'Les Trois Amis', mail: "lestrois@amis.org", adresse: "1234 Rue Tremblay, Longueuil", telephone: "450-000-1111"}])
Employe.create([{nom: 'Cadieux', prenom: "Jean-René", courriel: "jrc@hotmail.com", role: "Employé", motDePasse: "password", dejaEmbaucher: true, estDisponible: false, organisme_id: Organisme.last.id}])
Employe.create([{nom: 'Roy', prenom: "Loic", courriel: "loic@hotmail.com", role: "Employé", motDePasse: "password", dejaEmbaucher: true, estDisponible: false, organisme_id: Organisme.last.id}])
Employe.create([{nom: 'Champagne', prenom: "Emilie", courriel: "emilie.champagne@hotmail.com", role: "Employé", motDePasse: "password", dejaEmbaucher: false, estDisponible: true, organisme_id: Organisme.last.id}])
PointService.create([{nom: "Le Premier Pas", courriel: "premierpas@gmail.com", fax: "1-434-1237895", organisme_id: Organisme.last.id}])
PointService.create([{nom: "Le Deuxième Pas", courriel: "deuxièmepas@gmail.com", fax: "1-434-1237895", organisme_id: Organisme.last.id}])

Organisme.create([{name: 'Le Boisée des Lutins', mail: "boisee@lutins.com", adresse: "655 Terasse Beauchemin, Longueuil", telephone: "450-000-1111"}])
Employe.create([{nom: 'Tremblay', prenom: "Pierre", courriel: "pierreroche@hotmail.com", role: "Employé", motDePasse: "password", dejaEmbaucher: true, estDisponible: false, organisme_id: Organisme.last.id}])
Employe.create([{nom: 'Smith', prenom: "Jean-René", courriel: "jrSmithos@gmail.com", role: "Employé", motDePasse: "password", dejaEmbaucher: true, estDisponible: true, organisme_id: Organisme.last.id}])

Organisme.create([{name: 'Le Point Tournant', mail: "lestrois@amis.org", adresse: "62 Rue Dumouche, Boucherville", telephone: "450-000-1111"}])
Employe.create([{nom: 'Barril', prenom: "Pierre", courriel: "pBarril@aol.com", role: "Employé", motDePasse: "password", dejaEmbaucher: true, estDisponible: false, organisme_id: Organisme.last.id}])

Referent.create([{nom: 'Caron', prenom: 'Francis', courriel: 'francis.caron@gmail.com', fax: '1-212-9876543', refid: "string1"}])
Telephone.create(number: '450-448-2412', numberType: 'Maison', referent: Referent.last)

Referent.create([{nom: 'Flexington', prenom: 'Torgue', courriel: 'torgue.flexington@hotmail.com', fax: '1-212-5432687', refid: "string2"}])
Telephone.create(number: '123-456-7890', numberType: 'Maison', referent: Referent.last)

Referent.create([{nom: 'Laframboise', prenom: 'Tina', courriel: 'tinytina@yahoo.com', fax: '1-212-9182736', refid: "string3"}])
Telephone.create(number: '666-709-7121', numberType: 'Cellulaire', referent: Referent.last)

Referent.create([{nom: 'Smith', prenom: 'John', courriel: 'john.smith.1@yahoo.com', fax: '', refid: "string4"}])
Telephone.create(number: '611-450-4488', numberType: 'Maison', referent: Referent.last)

Referent.create([{nom: 'Tremblay', prenom: 'Daniel', courriel: 'daniel.tremblay.9403@gmail.com', fax: '', refid: "string5"}])
Telephone.create(number: '450-448-0000', numberType: 'Maison', referent: Referent.last)
Telephone.create(number: '438-490-0483', numberType: 'Cellulaire', referent: Referent.last)

Service.create([{nom: 'Service de garde', description: '', tarification: '10', estSubventionner: true, tarificationCISSS: '5'}])
Service.create([{nom: 'Psychologue', description: '', tarification: '19', estSubventionner: true, tarificationCISSS: '12'}])
Service.create([{nom: 'Salle à manger', description: 'Une salle disponnible pour faire des repas et manger', tarification: '9', estSubventionner: false, tarificationCISSS: '3'}])
Service.create([{nom: 'Activités Montessori', description: 'Des activités organisées qui permet au enfants de développer de nouveaux concepts', tarification: '25', estSubventionner: false, tarificationCISSS: '16'}])
Service.create([{nom: 'Salle d\'ordinateur', description: 'Une salle où les enfants peuvent faire des recherches et utiliser des ordinateurs', tarification: '2', estSubventionner: false, tarificationCISSS: '1'}])
Service.create([{nom: 'Friperie', description: 'Linge peu couteux pour aider les gens dans le besoin', tarification: '0', estSubventionner: false, tarificationCISSS: '0'}])
Service.create([{nom: 'Service d\'avocats', description: 'Un avocat/technicien juridique est sur place pour répondre à vos questions', tarification: '30', estSubventionner: true, tarificationCISSS: '10'}])
Service.create([{nom: 'Sécurité', description: 'Agent de la paix qui est sur place', tarification: '0', estSubventionner: true, tarificationCISSS: '0'}])

Departement.create([{description: "Finances"}])
Departement.create([{description: "Ressources Humaines"}])
Departement.create([{description: "Comptabilité"}])

User.create({:email => "coordonateur@test.com", :password => "coordonateur", :password_confirmation => "coordonateur", :supervisor_role => true, :user_role => false })
User.create({:email => "directeur@test.com", :password => "directeur", :password_confirmation => "directeur", :superadmin_role => true, :user_role => false })
User.create({:email => "employe@test.com", :password => "employe", :password_confirmation => "employe", :superadmin_role => false, :user_role => true })
