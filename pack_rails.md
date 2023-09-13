# Rails structure folders
```
  packwerk.yml
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
```

docker compose exec web bundle exec bin/packs help  
```
Commands:
  packs add_dependency packs/from_pack packs/to_pack                   # Add packs/to_pack to packs/from_pack/package.yml list of dependencies
  packs check [ packs/my_pack ]                                        # Run bin/packwerk check
  packs create packs/your_pack                                         # Create pack with name packs/your_pack
  packs get_info [ packs/my_pack packs/my_other_pack ]                 # Get info about size and violations for packs
  packs help [COMMAND]                                                 # Describe available commands or one specific command
  packs lint_package_todo_yml_files                                    # Lint `package_todo.yml` files to check for formatting issues
  packs lint_package_yml_files [ packs/my_pack packs/my_other_pack ]   # Lint `package.yml` files
  packs list_top_dependency_violations packs/your_pack                 # List the top dependency violations of packs/your_pack
  packs list_top_privacy_violations packs/your_pack                    # List the top privacy violations of packs/your_pack
  packs make_public path/to/file.rb path/to/directory                  # Make files or directories public API
  packs move packs/destination_pack path/to/file.rb path/to/directory  # Move files or directories from one pack to another
  packs move_to_parent packs/child_pack packs/parent_pack              # Set packs/child_pack as a child of packs/parent_pack
  packs rename                                                         # Rename a pack
  packs update                                                         # Run bin/packwerk update-todo
  packs validate                                                       # Run bin/packwerk validate (detects cycles)
  packs visualize [ packs/my_pack packs/my_other_pack ]                # Visualize packs

```