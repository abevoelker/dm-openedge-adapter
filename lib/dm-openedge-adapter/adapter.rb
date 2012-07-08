require 'do_openedge'
require 'dm-do-adapter'

module DataMapper

  Property.accept_options(:sequence)

  module Adapters
    class OpenedgeAdapter < DataObjectsAdapter
      module SQL #:nodoc:
        IDENTIFIER_MAX_LENGTH = 32

        private

        # Constructs INSERT statement for given query,
        #
        # @return [String] INSERT statement as a string
        #
        # @api private
=begin
        def insert_statement(model, properties, serial)
          statement = "INSERT INTO #{quote_name(model.storage_name(name))} "

          no_properties   = properties.empty?
          custom_sequence = serial && serial.options[:sequence]
          serial_field    = serial && quote_name(serial.field)

          if supports_default_values? && no_properties && !custom_sequence
            statement << "(#{serial_field}) " if serial
            statement << default_values_clause
          else
            # do not use custom sequence if identity field was assigned a value
            if custom_sequence && properties.include?(serial)
              custom_sequence = nil
            end
            statement << "("
            if custom_sequence
              statement << "#{serial_field}"
              statement << ", " unless no_properties
            end
            statement << "#{properties.map { |property| quote_name(property.field) }.join(', ')}) "
            statement << "VALUES ("
            if custom_sequence
              statement << "#{quote_name(custom_sequence)}.NEXTVAL"
              statement << ", " unless no_properties
            end
            statement << "#{(['?'] * properties.size).join(', ')})"
          end

          if supports_returning? && serial
            statement << returning_clause(serial)
          end

          statement
        end
=end

        # DEFAULT can only be specified for specific column values in the VALUES
        # portion of an INSERT, not as a general predicate for the entire statement.
        def supports_default_values?
          false
        end

        # OpenEdge supports LIMIT using TOP, but no support for OFFSET exists.
        # There is an enhancement request to request support for a ROWNUM pseudocolumn
        # similar to Oracle, but it may never materialize. ER OE00219573:
        # http://knowledgebase.progress.com/articles/Article/000030693
        #
        # TODO: If/when OFFSET/ROWNUM support is added, fix this method. If ROWNUM is
        # added, see the dm-oracle-adapter for an implementation using nested queries.
        def add_limit_offset!(statement, limit, offset, bind_values)
          if limit
            statement.replace statement.gsub(/^SELECT/i, "SELECT TOP #{limit}")
          end

          # TODO handle offsets - perhaps send a signal down to do_openedge
          # to manually adjust the ResultSet cursor?
        end

      end #module SQL

      include SQL
    end # class OpenedgeAdapter

    const_added(:OpenedgeAdapter)
  end # module Adapters
end # module DataMapper
