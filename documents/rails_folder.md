package.yml # root level pack
app/ # Unpackaged code
  models/
  ...
packs/
  my_domain/
    package.yml # See the packwerk docs for more info
    deprecated_references.yml # See the packwerk docs for more info
    app/
      public/ # Recommended location for public API
        my_domain.rb # creates the primary namespaces
        my_domain/
          my_subdomain.rb
      services/ # Private services
        my_domain/
          some_private_class.rb
      models/ # Private models
        some_other_non_namespaced_private_model.rb # this works too
        my_domain/
          my_private_namespaced_model.rb
      controllers/
      views/
    config/
      initializers/ # Initializers can live in packs and load as expected
    lib/
      tasks/
    spec/ # With packs-rails, specs for a pack live next to the pack
      public/
        my_domain_spec.rb
        my_domain/
          my_subdomain_spec.rb
      services/
        my_domain/
          some_private_class_spec.rb
      models/
        some_other_non_namespaced_private_model_spec.rb
        my_domain/
          my_private_namespaced_model_spec.rb
      factories/ # packs-rails will automatically load pack factories into FactoryBot
        my_domain/
          my_private_namespaced_model_factory.rb
  my_other_domain/
    ... # other packs have a similar structure
  my_other_other_domain/
    ...