class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  Refile.secret_key = '514eebac08cb222373f5f3fa83ff193af193cef49be717f9c36bdbebdd4c4dfa79c986a70941f70d4f0ba918899242dcb423504f95f89becf0b204427e54d620'
end
