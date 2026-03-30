class ApplicationRecord < ActiveRecord::Base
  require 'cpf_cnpj'
  primary_abstract_class

    def entidade_create
    self.status = "enabled"
    end

end
