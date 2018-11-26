module Command
  class UserDefined
    attr_reader :name

    def initialize(name)
      @name = name
      @statements = []
    end

    def add_statement(statement)
      @statements << statement
    end

    def execute(compass, location, tokens)
      operations_count = 0
      @statements.each do |statement|
        _, compass, location, tokens, cnt = statement.execute(
          compass, location, tokens
        )
        operations_count += cnt
      end
      [nil, compass, location, tokens, operations_count]
    end
  end
end
