require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    @columns ||= (DBConnection.execute2(<<-SQL)
        SELECT *
        FROM "#{table_name}"
      SQL
      ).first.map {|col| col.to_sym}

  end

  def self.finalize!
    self.columns.each do |column|

      define_method("#{column}") do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end

    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self.to_s.tableize}"
  end

  def self.all
    # ...
    results = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM "#{table_name}"
    SQL

    parse_all(results.drop(1))
  end

  def self.parse_all(results)
    # ...
      results.map do |att_hash|
        self.new(att_hash)
      end

  end

  def self.find(id)
    # ...
    obj = DBConnection.execute2(<<-SQL, id)
      SELECT *
      FROM "#{table_name}"
      WHERE id = ?
    SQL
    return nil if obj.last.is_a? Array
    self.new(obj.last)
  end

  def initialize(params = {})
    # # ...
    params.each do |key, value|
      attr_name = key.to_sym
      raise "unknown attribute '#{key}'" unless self.class.columns.include?(attr_name)
      self.class.finalize!
      send("#{attr_name}=", value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    col = self.class.columns #[:id, :name, :owner_id]
    # ...
    col.map do |col|
      self.send(col)
    end
  end

  def insert
    # ...
    q = (["?"] * attribute_values.length).join(", ")

    DBConnection.execute2(<<-SQL, attribute_values)
    INSERT INTO
    #{self.class.table_name} (#{self.class.columns.join(", ")})
    VALUES
     (#{q})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    col = self.class.columns.map do |colname|
      "#{colname} = ?"
    end

    DBConnection.execute2(<<-SQL, attribute_values, attribute_values.first)
    UPDATE #{self.class.table_name}
    SET #{col.join(", ")}
    WHERE id = ?
    SQL
  end

  def save
    # ...
    if attribute_values.first.nil?
      insert
    else
      update
    end
  end
end
