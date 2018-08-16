require_relative('../db/sql_runner.rb')

class Casting

  attr_reader :id
  attr_accessor :star_id, :movie_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @star_id = options['star_id'].to_i
    @movie_id = options['movie_id'].to_i
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings
    (star_id, movie_id, fee)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@star_id, @movie_id, @fee]
    casting = SqlRunner.run(sql,values).first
    @id = casting['id'].to_i
  end


end