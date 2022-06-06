# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create!(name: 'ADMIN', email: 'admin@email.com.br', password: 'senha123', role: :admin, confirmed_at: DateTime.current)
User.create!(name: 'JOSE CARLOS', email: 'josecarlos@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'MARIA CANDIDA', email: 'mariacandida@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'THIAGO OLIVEIRA', email: 'thiagooliveira@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'ELIANA NOGUEIRA', email: 'eliananogueira@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'CARLOS BATISTA', email: 'carlosbatista@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'CAROLINA MACHADO', email: 'carolinamachado@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)
User.create!(name: 'CELSO DE MELO', email: 'celsomelo@email.com.br', password: 'senha123', role: :normal, confirmed_at: DateTime.current)

Product.create!(name: 'CURSO DE BEM-ESTAR', producer_id: User.find_by(name: 'JOSE CARLOS').id, price: 127.5)
Product.create!(name: 'DOMINANDO INVESTIMENTOS', producer_id: User.find_by(name: 'MARIA CANDIDA').id, price: 500.0)
Product.create!(name: 'DESENVOLVEDOR FULL STACK', producer_id: User.find_by(name: 'ELIANA NOGUEIRA').id, price: 1550.0)

UsersProduct.create!(user: User.find_by(name: 'THIAGO OLIVEIRA'), product: Product.find_by(name: 'CURSO DE BEM-ESTAR'), type: :affiliate)
UsersProduct.create!(user: User.find_by(name: 'CARLOS BATISTA'), product: Product.find_by(name: 'DESENVOLVEDOR FULL STACK'), type: :affiliate)
UsersProduct.create!(user: User.find_by(name: 'CAROLINA MACHADO'), product: Product.find_by(name: 'DESENVOLVEDOR FULL STACK'), type: :affiliate)
UsersProduct.create!(user: User.find_by(name: 'CELSO DE MELO'), product: Product.find_by(name: 'DESENVOLVEDOR FULL STACK'), type: :affiliate)
