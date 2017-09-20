# Migrationでテーブル作成する時に、ROW_FORMATをDYNAMICで作成する
# http://qiita.com/kamipo/items/101aaf8159cf1470d823#comment-6363bc18175dc0426af7
ActiveSupport.on_load(:active_record) do
  require 'active_record/connection_adapters/mysql2_adapter'

  module ActiveRecord
    module ConnectionAdapters
      module MysqlMigrationExt
        # rubocop:disable Metrics/AbcSize
        def create_table(table_name, options = {})
          innodb_variables = []
          unless show_variable('innodb_file_per_table') == 1
            innodb_variables << 'innodb_file_per_table = 1'
          end
          unless show_variable('innodb_file_format') == 'Barracuda'
            innodb_variables << 'innodb_file_format = Barracuda'
          end
          unless show_variable('innodb_large_prefix') == 1
            innodb_variables << 'innodb_large_prefix = 1'
          end
          unless innodb_variables.empty?
            execute("SET GLOBAL #{innodb_variables.join(',')}".tap { |sql| puts "NOTICE: #{sql}" })
            required_innodb_file_format_barracuda_message
          end
          super(table_name, options.reverse_merge(options: 'ROW_FORMAT=DYNAMIC'))
        end
        # rubocop:enable Metrics/AbcSize

        def required_innodb_file_format_barracuda_message
          puts 'This application required MySQL 5.6 and innodb_file_format = Barracuda.'
          puts 'Please add the following setting in your my.cnf.'
          puts ''
          puts '```my.cnf'
          puts '[mysqld]'
          puts 'innodb_file_format = Barracuda'
          puts 'innodb_large_prefix = 1'
          puts 'innodb_file_per_table = 1'
          puts '```'
          puts ''
        end
      end

      class Mysql2Adapter
        include MysqlMigrationExt
      end
    end
  end
end
