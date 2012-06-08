require 'dm-openedge-adapter'
require 'dm-core/spec/setup'

module DataMapper
  module Spec
    module Adapters

      class OpenedgeAdapter < Adapter
        
        def test_connection(adapter)
          adapter.select('SELECT SIGN(1) FROM SYSPROGRESS.SYSCALCTABLE')
        end

      end

      use OpenedgeAdapter

    end
  end
end
