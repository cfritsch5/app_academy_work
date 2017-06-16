require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    # keys_match = params.keys.map{|key| "#{key} = ?"}.join(" AND ")
    # query = DBConnection.execute2(<<-SQL, *params.values)
    #   SELECT *
    #   FROM #{table_name}
    #   WHERE #{keys_match}
    # SQL
    # parse_all(query)

    
    where_line = params.keys.map { |key| "#{key} = ?" }.join(" AND ")

results = DBConnection.execute(<<-SQL, *params.values)
  SELECT
    *
  FROM
    #{table_name}
  WHERE
    #{where_line}
SQL

parse_all(results)
  end

end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
