# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.1/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
